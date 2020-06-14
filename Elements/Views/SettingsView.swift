//
//  SettingsView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/14/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Temperature Unit")) {
                    Picker(selection: $viewModel.selectedUnit, label: Text("Temperature Unit")) {
                        Text("Kelvin").tag(0)
                        Text("Celsius").tag(1)
                        Text("Fahrenheit").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
