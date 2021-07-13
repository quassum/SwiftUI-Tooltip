//
//  TooltipConfig.swift
//
//  Created by Antoni Silvestrovic on 22/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

public protocol TooltipConfig {
    // MARK: - Alignment

    public var side: TooltipSide { get set }
    public var margin: CGFloat { get set }

    // MARK: - Tooltip container

    public var borderRadius: CGFloat { get set }
    public var borderWidth: CGFloat { get set }
    public var borderColor: Color { get set }
    public var backgroundColor: Color { get set }

    // MARK: - Margins and paddings

    public var contentPaddingLeft: CGFloat { get set }
    public var contentPaddingRight: CGFloat { get set }
    public var contentPaddingTop: CGFloat { get set }
    public var contentPaddingBottom: CGFloat { get set }

    public var contentPaddingEdgeInsets: EdgeInsets { get }

    // MARK: - Tooltip arrow

    public var showArrow: Bool { get set }
    public var arrowWidth: CGFloat { get set }
    public var arrowHeight: CGFloat { get set }
    
    // MARK: - Animation settings
    public var enableAnimation: Bool { get set }
    public var animationOffset: CGFloat { get set }
    public var animationTime: Double { get set }
}
