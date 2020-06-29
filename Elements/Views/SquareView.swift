//
//  SquareView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/5/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct SquareView: View {
    
    let element: Element
    let showAtomicNumber: Bool
    let showName: Bool
    let showAtomicMass: Bool
    
    var body: some View {
        ZStack {
            
            if showAtomicNumber {
                Text("\(element.number)")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            
            VStack {
                Text(element.symbol)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.01)
                if showName {
                    Text(element.name)
                }
            }
            
            if element.atomicMass != nil && showAtomicMass {
                Text(String(element.atomicMass!))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            }
            
        }
        .foregroundColor(.white)
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .background(elementColor[element.category])
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: false, showName: false, showAtomicMass: false)
                .previewLayout(.fixed(width: 50, height: 50))
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: true, showName: true, showAtomicMass: false)
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: true, showName: true, showAtomicMass: true)
                .previewLayout(.fixed(width: 200, height: 200))
        }
    }
}
