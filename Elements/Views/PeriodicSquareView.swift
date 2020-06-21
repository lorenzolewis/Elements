//
//  PeriodicSquareView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/5/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct PeriodicSquareView: View {
    
    let element: Element
    
    var body: some View {
        ZStack {
                Text(element.symbol)
                    .bold()
                    .font(.system(size: 40))
            
                if element.atomicMass != nil {
                    Text(String(element.atomicMass!))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
                }

            VStack(alignment: .leading) {
                Text("\(element.number)")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(maxWidth: .infinity)
        }
        .modifier(OneLineText())
        .foregroundColor(.white)
        .padding(5)
        .frame(width: 100, height: 100)
        .background(elementColor[element.category] ?? Color.black)
    }
}



struct PeriodicSquareView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodicSquareView(element: ElementsModel().elements[30])
    }
}
