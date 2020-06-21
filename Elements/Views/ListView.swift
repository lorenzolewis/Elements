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
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ASCollectionView(data: elements.elements) { item, _  in
                ElementCellView(element: item, color: elementColor[item.category] ?? Color.black)
            }
            .layout {
                .grid(layoutMode: .adaptive(withMinItemSize: 100),
                      itemSpacing: 5,
                      lineSpacing: 5,
                      itemSize: .absolute(100))
            }
            .edgesIgnoringSafeArea(.all)
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
