//
//  ContentView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/2/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    
    @ViewBuilder var body: some View {
        
        #if os(iOS)
        if horizontalSizeClass == .compact {
            ListView()
        } else {
            PeriodicTableView()
        }
        #else
        PeriodicTableView()
        #endif
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
