//
//  ArrowOnlyTooltipConfig.swift
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

public struct ArrowOnlyTooltipConfig: TooltipConfig {
    static var shared = ArrowOnlyTooltipConfig()

    public var side: TooltipSide = .bottom
    public var margin: CGFloat = 8
    public var zIndex: Double = 10000
        
    public var width: CGFloat?
    public var height: CGFloat?

    public var borderRadius: CGFloat = 8
    public var borderRadiusStyle: RoundedCornerStyle = .circular
    public var borderWidth: CGFloat = 0
    public var borderColor: Color = Color.primary
    public var backgroundColor: Color = Color.clear
    public var shadowColor: Color = .clear
    public var shadowRadius: CGFloat = 0
    public var shadowOffset: CGPoint = .zero

    public var contentPaddingLeft: CGFloat = 8
    public var contentPaddingRight: CGFloat = 8
    public var contentPaddingTop: CGFloat = 4
    public var contentPaddingBottom: CGFloat = 4

    public var contentPaddingEdgeInsets: EdgeInsets {
        EdgeInsets(
            top: contentPaddingTop,
            leading: contentPaddingLeft,
            bottom: contentPaddingBottom,
            trailing: contentPaddingRight
        )
    }

    public var showArrow: Bool = true
    public var arrowWidth: CGFloat = 12
    public var arrowHeight: CGFloat = 6
    
    public var enableAnimation: Bool = false
    public var animationOffset: CGFloat = 10
    public var animationTime: Double = 1
    public var animation: Optional<Animation> = .easeInOut

    public var transition: AnyTransition = .opacity

    public init() {}

    public init(side: TooltipSide) {
        self.side = side
    }
}
