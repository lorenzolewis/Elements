//
//  SettingsViewModel.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/14/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedUnit: Int {
        didSet {
            UserDefaults.standard.set(selectedUnit, forKey: "TempatureUnit")
        }
    }
    
    init() {
        if let unit = UserDefaults.standard.object(forKey: "TempatureUnit") as? Int {
            selectedUnit = unit
        } else {
            selectedUnit = 0
        }
    }
}
