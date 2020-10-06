//
//  ElementsApp.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/28/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

@main
struct ElementsApp: App {
    
    let elementsModel = ElementsModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(elementsModel: elementsModel)
        }
    }
    
}

// We should really be checking this out
