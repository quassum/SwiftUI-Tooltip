//
//  TooltipConfig.swift
//
//  Created by Antoni Silvestrovic on 22/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

public protocol TooltipConfig {
    // MARK: - Alignment

    var side: TooltipSide { get set }
    var margin: CGFloat { get set }

    // MARK: - Tooltip container

    var borderRadius: CGFloat { get set }
    var borderWidth: CGFloat { get set }
    var borderColor: Color { get set }
    var backgroundColor: Color { get set }

    // MARK: - Margins and paddings

    var contentPaddingLeft: CGFloat { get set }
    var contentPaddingRight: CGFloat { get set }
    var contentPaddingTop: CGFloat { get set }
    var contentPaddingBottom: CGFloat { get set }

    var contentPaddingEdgeInsets: EdgeInsets { get }

    // MARK: - Tooltip arrow

    var showArrow: Bool { get set }
    var arrowWidth: CGFloat { get set }
    var arrowHeight: CGFloat { get set }
    
    // MARK: - Animation settings
    var enableAnimation: Bool { get set }
    var animationOffset: CGFloat { get set }
    var animationTime: Double { get set }

    var transition: AnyTransition { get set }
}
