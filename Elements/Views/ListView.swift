//
//  ListView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/28/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let elementsModel: ElementsModel
    private let gridItems = [GridItem(.adaptive(minimum: 80))]
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems){
                    ForEach(elementsModel.elements) { element  in
                        
                        NavigationLink(destination: ElementView(element: element)) {
                            SquareView(element: element, showAtomicNumber: true, showName: true, showAtomicMass: false)
                        }
                    }
                }
                .padding([.horizontal, .top])
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
                                    
                )}
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(elementsModel: ElementsModel())
    }
}
