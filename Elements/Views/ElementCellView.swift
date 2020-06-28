//
//  ElementCellView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/3/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ElementCellView: View {
    
    let element: Element
    let color: Color
    
    var body: some View {
        NavigationLink(destination: ElementView(element: element)) {
            ZStack(alignment: .topLeading) {
                VStack {
                    Text(self.element.symbol)
                        .bold()
                        .lineLimit(1)
                        .font(.largeTitle)
                        .minimumScaleFactor(0.1)
                    
                    Text(self.element.name)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
                Text("\(self.element.number)")
                    .padding(5)
            }
            .foregroundColor(.white)
        }
        .environment(\.horizontalSizeClass, .compact)
        
    }
    
}

struct ElementCellView_Previews: PreviewProvider {
    static var previews: some View {
        ElementCellView(element: ElementsModel().elements[30], color: .black)
    }
}
