//
//  PeriodicTableView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/28/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct PeriodicTableView: View {
    
    let elementsModel: ElementsModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: elementsModel.maxX)) {
            ForEach(elementsModel.elements) { element in
                SquareView(element: element, showAtomicNumber: false, showName: false, showAtomicMass: false)
            }
        }
    }
}

struct PeriodicTableView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodicTableView(elementsModel: ElementsModel())
    }
}
