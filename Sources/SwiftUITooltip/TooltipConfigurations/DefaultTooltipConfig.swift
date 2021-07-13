//
//  DefaultTooltipConfig.swift
//  rythmic
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

struct DefaultTooltipConfig: TooltipConfig {
    static var shared = DefaultTooltipConfig()

    var side: TooltipSide = .bottom
    var margin: CGFloat = 8

    var borderRadius: CGFloat = 8
    var borderWidth: CGFloat = 2
    var borderColor: Color = Color.primary

    var contentPaddingLeft: CGFloat = 8
    var contentPaddingRight: CGFloat = 8
    var contentPaddingTop: CGFloat = 4
    var contentPaddingBottom: CGFloat = 4

    var contentPaddingEdgeInsets: EdgeInsets {
        EdgeInsets(
            top: contentPaddingTop,
            leading: contentPaddingLeft,
            bottom: contentPaddingBottom,
            trailing: contentPaddingRight
        )
    }

    var showArrow: Bool = true
    var arrowWidth: CGFloat = 12
    var arrowHeight: CGFloat = 6
    
    var enableAnimation: Bool = false
    var animationOffset: CGFloat = 10
    var animationTime: Double = 1

    public init() {}

    public init(side: TooltipSide) {
        self.side = side
    }
}
