//
//  TooltipViewExtension.swift
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

// MARK: - with `enabled: Bool`
public extension View {
    // Only enable parameter accessible
    func tooltip<TooltipContent: View>(
        _ enabled: Bool = true,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        let config: TooltipConfig = DefaultTooltipConfig.shared

        return modifier(TooltipModifier(enabled: enabled, config: config, content: content))
    }

    // Only enable and config available
    func tooltip<TooltipContent: View>(
        _ enabled: Bool = true,
        config: TooltipConfig,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        modifier(TooltipModifier(enabled: enabled, config: config, content: content))
    }

    // Enable and side are available
    func tooltip<TooltipContent: View>(
        _ enabled: Bool = true,
        side: TooltipSide,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        var config = DefaultTooltipConfig.shared
        config.side = side

        return modifier(TooltipModifier(enabled: enabled, config: config, content: content))
    }
    
    // Enable, side and config parameters available
    func tooltip<TooltipContent: View>(
        _ enabled: Bool = true,
        side: TooltipSide,
        config: TooltipConfig,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        var config = config
        config.side = side

        return modifier(TooltipModifier(enabled: enabled, config: config, content: content))
    }
}

// MARK: - Without `enabled: Bool`
public extension View {
    // No-parameter tooltip
    func tooltip<TooltipContent: View>(
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        let config = DefaultTooltipConfig.shared
        
        return modifier(TooltipModifier(enabled: true, config: config, content: content))
    }
    
    // Only side configurable
    func tooltip<TooltipContent: View>(
        _ side: TooltipSide,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        var config = DefaultTooltipConfig.shared
        config.side = side

        return modifier(TooltipModifier(enabled: true, config: config, content: content))
    }

    // Side and config are configurable
    func tooltip<TooltipContent: View>(
        _ side: TooltipSide,
        config: TooltipConfig,
        @ViewBuilder content: @escaping () -> TooltipContent
    ) -> some View {
        var config = config
        config.side = side

        return modifier(TooltipModifier(enabled: true, config: config, content: content))
    }
}
