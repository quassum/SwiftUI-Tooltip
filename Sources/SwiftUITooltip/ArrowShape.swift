//
//  ArrowShape.swift
//  rythmic
//
//  Created by Antoni Silvestrovic on 24/10/2020.
//  Copyright © 2020 Quassum Manus. All rights reserved.
//

import SwiftUI

public struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addLines([
            CGPoint(x: 0, y: rect.height),
            CGPoint(x: rect.width / 2, y: 0),
            CGPoint(x: rect.width, y: rect.height),
        ])
        return path
    }
}
