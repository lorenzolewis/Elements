//
//  NumberGrid.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/6/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

//struct NumberGrid: View {
//    
//    let element: Element
//    let groupModel: GroupModel
//    
//    var body: some View {
//        HStack {
//            if (groupModel.value != nil && groupModel.title != nil) {
//                ElementViewPill(description: groupModel.title,
//                                value: String(groupModel.value!), element: element)
//            }
//            Spacer()
//            .layoutPriority(-1)
//        }
//    }
//}

struct ElementViewPill: View {
    
    let description: String
    let value: String
    let element: Element
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .foregroundColor(elementColor[self.element.category])
                    .font(Font.body.smallCaps())
            Text(value)

        }
    }
}
