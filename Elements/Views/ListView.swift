//
//  ListView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/2/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct ListView: View {
    
    private let elements = ElementsModel()
    private let gridItems = [GridItem(.adaptive(minimum: 100))]
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(elements.elements) { element in
                        NavigationLink(destination: ElementView(element: element)) {
                            SquareView(element: element, showAtomicNumber: true, showName: true, showAtomicMass: false)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("🧪 Elements")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showSheet.toggle()
                                        print("Hello")
                                    }) {
                                        HStack {
                                            Image(systemName: "gear")
                                            Text("Settings")
                                        }
                                        .sheet(isPresented: $showSheet, content: {
                                            SettingsView()
                                        })
                                    }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
