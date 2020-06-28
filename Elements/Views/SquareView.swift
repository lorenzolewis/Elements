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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            
            GeometryReader { geo in
                VStack {

                    Text(element.symbol)
                        .bold()
                        .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.4: geo.size.height * 0.4))
                    
                    if showName {
                        Text(element.name)
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            }
            
            if showAtomicMass {
                Text(String(element.atomicMass))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(5)
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(.white)
        
        .background(elementColor[element.category] ?? Color.black)
    }
}



struct PeriodicSquareView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: false, showName: false, showAtomicMass: false)
                .previewLayout(.fixed(width: 75, height: 75))
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: true, showName: true, showAtomicMass: false)
                .previewLayout(.fixed(width: 100, height: 200))
            SquareView(element: ElementsModel().elements[30], showAtomicNumber: true, showName: true, showAtomicMass: true)
                .previewLayout(.fixed(width: 350, height: 350))
        }
    }
}
