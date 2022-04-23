//
//  Tooltip.swift
//
//  Created by Antoni Silvestrovic on 19/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

struct TooltipModifier<TooltipContent: View>: ViewModifier {
    // MARK: - Uninitialised properties
    var enabled: Binding<Bool>
    var config: TooltipConfig
    var content: TooltipContent


    // MARK: - Initialisers

    init(enabled: Binding<Bool>, config: TooltipConfig, @ViewBuilder content: @escaping () -> TooltipContent) {
        self.enabled = enabled
        self.config = config
        self.content = content()
    }

    // MARK: - Local state

    @State private var contentWidth: CGFloat = 10
    @State private var contentHeight: CGFloat = 10
    
    @State var animationOffset: CGFloat = 0

    // MARK: - Computed properties

    var arrowRotation: Double { Double(config.side.rawValue) * .pi / 4 }
    var actualArrowHeight: CGFloat { config.showArrow ? config.arrowHeight : 0 }

    var arrowOffsetX: CGFloat {
        switch config.side {
        case .bottom, .center, .top:
            return 0
        case .leading:
            return (contentWidth / 2 + config.arrowHeight / 2)
        case .leadingTop, .leadingBottom:
            return (contentWidth / 2
                + config.arrowHeight / 2
                - config.borderRadius / 2
                - config.borderWidth / 2)
        case .trailing:
            return -(contentWidth / 2 + config.arrowHeight / 2)
        case .trailingTop, .trailingBottom:
            return -(contentWidth / 2
                + config.arrowHeight / 2
                - config.borderRadius / 2
                - config.borderWidth / 2)
        }
    }

    var arrowOffsetY: CGFloat {
        switch config.side {
        case .leading, .center, .trailing:
            return 0
        case .top:
            return (contentHeight / 2 + config.arrowHeight / 2)
        case .trailingTop, .leadingTop:
            return (contentHeight / 2
                + config.arrowHeight / 2
                - config.borderRadius / 2
                - config.borderWidth / 2)
        case .bottom:
            return -(contentHeight / 2 + config.arrowHeight / 2)
        case .leadingBottom, .trailingBottom:
            return -(contentHeight / 2
                + config.arrowHeight / 2
                - config.borderRadius / 2
                - config.borderWidth / 2)
        }
    }

    // MARK: - Helper functions

    private func offsetHorizontal(_ g: GeometryProxy) -> CGFloat {
        switch config.side {
        case .leading, .leadingTop, .leadingBottom:
            return -(contentWidth + config.margin + actualArrowHeight + animationOffset)
        case .trailing, .trailingTop, .trailingBottom:
            return g.size.width + config.margin + actualArrowHeight + animationOffset
        case .top, .center, .bottom:
            return (g.size.width - contentWidth) / 2
        }
    }

    private func offsetVertical(_ g: GeometryProxy) -> CGFloat {
        switch config.side {
        case .top, .trailingTop, .leadingTop:
            return -(contentHeight + config.margin + actualArrowHeight + animationOffset)
        case .bottom, .leadingBottom, .trailingBottom:
            return g.size.height + config.margin + actualArrowHeight + animationOffset
        case .leading, .center, .trailing:
            return (g.size.height - contentHeight) / 2
        }
    }
    
    // MARK: - Animation stuff
    
    private func dispatchAnimation() {
        if (config.enableAnimation) {
            DispatchQueue.main.asyncAfter(deadline: .now() + config.animationTime) {
                self.animationOffset = config.animationOffset
                DispatchQueue.main.asyncAfter(deadline: .now() + config.animationTime*0.1) {
                    self.animationOffset = 0
                    
                    self.dispatchAnimation()
                }
            }
        }
    }

    // MARK: - TooltipModifier Body Properties

    private var sizeMeasurer: some View {
        GeometryReader { g in
            Text("")
                .onAppear {
                    self.contentWidth = g.size.width
                    self.contentHeight = g.size.height
                }
        }
    }

    private var arrowView: some View {
        return ArrowShape()
            .rotation(Angle(radians: self.arrowRotation))
            .stroke(self.config.borderColor)
            .background(ArrowShape()
                .offset(x: 0, y: 1)
                .rotation(Angle(radians: self.arrowRotation))
                .frame(width: self.config.arrowWidth+2, height: self.config.arrowHeight+1)
                .foregroundColor(self.config.backgroundColor)
                
            ).frame(width: self.config.arrowWidth, height: self.config.arrowHeight)
            .offset(x: self.arrowOffsetX, y: self.arrowOffsetY)
    }

    private var arrowCutoutMask: some View {
        return ZStack {
            Rectangle()
                .frame(
                    width: self.contentWidth + self.config.borderWidth * 2,
                    height: self.contentHeight + self.config.borderWidth * 2)
                .foregroundColor(.white)
            Rectangle()
                .frame(
                    width: self.config.arrowWidth,
                    height: self.config.arrowHeight + self.config.borderWidth)
                .rotationEffect(Angle(radians: self.arrowRotation))
                .offset(
                    x: self.arrowOffsetX,
                    y: self.arrowOffsetY)
                .foregroundColor(.black)
        }
        .compositingGroup()
        .luminanceToAlpha()
    }

    var tooltipBody: some View {
        GeometryReader { g in
            ZStack {
                RoundedRectangle(cornerRadius: self.config.borderRadius)
                    .stroke(self.config.borderWidth == 0 ? Color.clear : self.config.borderColor)
                    .background(RoundedRectangle(cornerRadius: self.config.borderRadius)
                                .foregroundColor(self.config.backgroundColor))
                    .frame(width: self.contentWidth, height: self.contentHeight)
                    .mask(self.arrowCutoutMask)
                
                ZStack {
                    content
                        .padding(self.config.contentPaddingEdgeInsets)
                        .fixedSize()
                }
                .background(self.sizeMeasurer)
                    .overlay(self.arrowView)
            }
            .offset(x: self.offsetHorizontal(g), y: self.offsetVertical(g))
            .onAppear {
                self.dispatchAnimation()
            }
        }
    }

    // MARK: - ViewModifier properties

    func body(content: Content) -> some View {
        content
            .overlay(enabled.wrappedValue ? tooltipBody.transition(config.transition) : nil)
    }
}

struct Tooltip_Previews: PreviewProvider {
    static var previews: some View {
        var config = DefaultTooltipConfig(side: .top)
        config.backgroundColor = Color(red: 0.8, green: 0.9, blue: 1)
        
        
        return VStack {
            Text("Say...").tooltip(.constant(true), config: config) {
                Text("Something nice!")
            }
        }.previewDevice(.init(stringLiteral: "iPhone 12 mini"))
    }
}
