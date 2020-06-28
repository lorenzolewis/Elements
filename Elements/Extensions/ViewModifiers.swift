//
//  ViewModifiers.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/4/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ElementInfoHeading: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        return content
            .font(Font.body.smallCaps())
            .foregroundColor(color)
            .padding(.top)
    }
}

struct OneLineText: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
}
