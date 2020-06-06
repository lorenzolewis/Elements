//
//  ElementViewTextRow.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/5/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ElementViewTextRow: View {
    
    let element: Element
    let heading: String
    
    var body: some View {
        VStack {
            Text(heading)
                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
            Text(self.element.category.capitalized)
        }
    }
}
//
//struct ElementViewTextRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ElementViewTextRow()
//    }
//}
