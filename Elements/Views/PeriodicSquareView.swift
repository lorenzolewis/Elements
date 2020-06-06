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
    let geo: GeometryProxy
    
    var body: some View {
        ZStack {
            Text(element.symbol)
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
        .frame(width: geo.size.width * 0.25, height: 100)
        .background(elementColor[element.category])
    }
}

//struct PeriodicSquareView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeriodicSquareView(
//            element: Element(name: "Oxygen",
//                             appearance: nil,
//                             atomicMass: 15.999,
//                             boil: 90.188,
//                             category: "diatomic nonmetal",
//                             color: nil,
//                             density: 1.429,
//                             discoveredBy: "Carl Wilhelm Scheele",
//                             melt: 54.36,
//                             molarHeat: nil,
//                             namedBy: "Antoine Lavoisier",
//                             number: 8,
//                             period: 2,
//                             phase: .Gas,
//                             source: "https://en.wikipedia.org/wiki/Oxygen",
//                             spectralImg: "https://en.wikipedia.org/wiki/File:Oxygen_spectre.jpg",
//                             summary: "Oxygen is a chemical",
//                             symbol: "O",
//                             xpos: 16,
//                             ypos: 2,
//                             shells: [2, 6],
//                             electronConfiguration: "1s2 2s2 2p4",
//                             electronAffinity: 140.9760,
//                             electronegativityPauling: 3.44,
//                             ionizationEnergies: [
//                                1313.9,
//                                3388.3,
//                                5300.5,
//                                7469.2,
//                                10989.5,
//                                13326.5,
//                                71330,
//                                84078.0
//            ]), geo: GeometryProxy.frame(in: CoordinateSpace.global))
//    }
//}
