//
//  PeriodTableViewModel.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/3/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import Foundation

struct PeriodicTableViewModel {
    let elementsModel = ElementsModel()
    var maxX: Int {
        var max = 0
        for index in 0..<elementsModel.elements.count {
            if elementsModel.elements[index].xpos > max {
                max = elementsModel.elements[index].xpos
            }
        }
        return max
    }
    var maxY: Int {
        var max = 0
        for index in 0..<elementsModel.elements.count {
            if elementsModel.elements[index].ypos > max {
                max = elementsModel.elements[index].ypos
            }
        }
        return max
    }
}
