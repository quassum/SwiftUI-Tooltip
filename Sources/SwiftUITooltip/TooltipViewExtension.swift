//
//  TooltipViewExtension.swift
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

public extension View {
    func tooltip<TooltipContent: View>(isEnabled: Binding<Bool>, @ViewBuilder content: @escaping () -> TooltipContent) -> some View {
        let config: TooltipConfig = DefaultTooltipConfig.shared

        return modifier(TooltipModifier(isEnabled: isEnabled, config: config, content: content))
    }

    func tooltip<TooltipContent: View>(isEnabled: Binding<Bool>, config: TooltipConfig, @ViewBuilder content: @escaping () -> TooltipContent) -> some View {
        modifier(TooltipModifier(isEnabled: isEnabled, config: config, content: content))
    }

    func tooltip<TooltipContent: View>(_ side: TooltipSide, isEnabled: Binding<Bool>, @ViewBuilder content: @escaping () -> TooltipContent) -> some View {
        var config = DefaultTooltipConfig.shared
        config.side = side

        return modifier(TooltipModifier(isEnabled: isEnabled, config: config, content: content))
    }
    
    func tooltip<TooltipContent: View>(_ side: TooltipSide, isEnabled: Binding<Bool>, config: TooltipConfig, @ViewBuilder content: @escaping () -> TooltipContent) -> some View {
        var config = config
        config.side = side

        return modifier(TooltipModifier(isEnabled: isEnabled, config: config, content: content))
    }
}
