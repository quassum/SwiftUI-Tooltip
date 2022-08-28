//
//  TooltipSide.swift
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI


public enum TooltipSide: Int {
    case center = -1
    
    case left = 2
    case right = 6
    case top = 4
    case bottom = 0

    case topLeft = 3
    case topRight = 5
    case bottomLeft = 1
    case bottomRight = 7
    
    func getArrowAngleRadians() -> Optional<Double> {
        if self == .center { return nil }
        return Double(self.rawValue) * .pi / 4
    }
    
    func shouldShowArrow() -> Bool {
        if self == .center { return false }
        return true
    }
}
