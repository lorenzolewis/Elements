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
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ASCollectionView(data: elements.elements) { item, _  in
                ElementCellView(element: item, color: elementColor[item.category]!)
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
                        Text("🙏 Credits")
                    }
                    .sheet(isPresented: $showSheet, content: {
                        NavigationView {
                            Form {
                                Section(header: Text("Periodic Table Data")) {
                                    Button(action: {
                                        guard let url = URL(string: "https://github.com/Bowserinator/Periodic-Table-JSON") else {return}
                                        UIApplication.shared.open(url)
                                    } ) {
                                        HStack {
                                            Text("Periodic-Table-JSON (Github)")
                                            Image(systemName: "arrow.up.right.square")
                                        }
                                    }
                                }
                                
                                Section(header: Text("Collection View Package"), footer: VStack {
                                    Text("Special thanks to my baba, Mohammed Ali")
                                        .padding(.top)
                                    Text("Created as part of AppleJam 2020")
                                        .padding(.top)
                                    Text("Made with ❤️ in Kansas City")
                                        .padding(.top)
                                    Spacer()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                    
                                }) {
                                    Button(action: {
                                        guard let url = URL(string: "https://github.com/apptekstudios/ASCollectionView") else {return}
                                        UIApplication.shared.open(url)
                                    } ) {
                                        HStack {
                                            Text("ASCollectionView (Github)")
                                            Image(systemName: "arrow.up.right.square")
                                        }
                                    }
                                }
                                .navigationBarTitle("🙏 Credits", displayMode: .inline)
                            }
                        }
                    })
                }
                
            )}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
