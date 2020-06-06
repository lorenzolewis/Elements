//
//  ContentView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/2/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct ContentView: View {
    
    private let elements = ElementsModel()
    @State private var sortIsShowing = false
    
    var body: some View {
        NavigationView {
            ASCollectionView(data: elements.elements) { item, _  in
                ElementCellView(element: item)
//                    self.elements.elementColor[item.category] ?? Color.pink)
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
                    self.sortIsShowing.toggle()
                    print("Hello")
                }) {
                    HStack {
                        Image(systemName: sortIsShowing ? "arrow.up.arrow.down.circle.fill" : "arrow.up.arrow.down.circle")
                        Text("Sort")
                    }
                }
                
            )}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
