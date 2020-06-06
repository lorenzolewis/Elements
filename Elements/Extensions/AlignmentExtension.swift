//
//  AlignmentExtension.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/4/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {
    
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[HorizontalAlignment.center] }
    }
    
    static let squareAlignment =
        HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[VerticalAlignment.center] }
    }
    
    static let squareAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let squareAlignment = Alignment(horizontal: .squareAlignment,
                                       vertical: .squareAlignment)
}
