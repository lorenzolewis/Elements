//
//  ElementView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/3/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct ElementView: View {
    
    let element: Element
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    
                    // Title
                    HStack {
                        PeriodicSquareView(element: self.element)
                        VStack(alignment: .leading) {
                            Text(self.element.name)
                                .bold()
                                .modifier(OneLineText())
                                .foregroundColor(elementColor[self.element.category])
                                .font(.largeTitle)
                            Text(self.element.category.capitalized)
                        }
                    }
                    
                    // Group and Electronegativity
                    // TODO: Align, start w/ hstack, then vstack
                    HStack {
                        VStack(alignment: .leading) {
                            Text("group")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                            Text("\(self.element.xpos)")
                            
                            VStack(alignment: .leading) {
                                Text("phase")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                Text(self.element.phase.rawValue)
                            }
                        }
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            if self.element.electronegativityPauling != nil {
                                VStack(alignment: .leading) {
                                    Text("e. negativity")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                    Text(String(format: "%g", self.element.electronegativityPauling!))
                                }
                                
                            }
                            if self.element.melt != nil {
                                VStack(alignment: .leading) {
                                    Text("melt point")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                    Text(formatTemperature(self.element.melt!))
                                }
                            }
                        }
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            if self.element.density != nil {
                                VStack(alignment: .leading) {
                                    Text("density")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                    Text(String(format: "%g", self.element.density!) + " g/L")
                                }
                            }
                            if self.element.boil != nil {
                                VStack(alignment: .leading) {
                                    Text("boil point")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                    Text(formatTemperature(self.element.boil!))
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    
                    Group {
                        if self.element.appearance != nil {
                            Group {
                                Text("appearance")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                Text(self.element.appearance!.capitalizingFirstLetter())
                            }
                        }
                        
                        if self.element.color != nil {
                            Group {
                                Text("color")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                Text(self.element.color!.capitalized)
                            }
                        }
                        
                        Text("electron configuration")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))

                        if self.element.electronConfigurationSemantic != nil {
                            Text(formatElectronConfiguration(self.element.electronConfigurationSemantic!))
                            if self.element.electronConfigurationSemantic!.contains("*") {
                                Text("(Configuration not yet confirmed)")
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        ShellView(element: self.element, geo: geo)
                            .padding(.top)
                    }
                    Group {
                        Text("summary")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                        Text(self.element.summary)
                    }
                    
                    Group {
                        if self.element.discoveredBy != nil {
                            Group {
                                Text("discovered by")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                Text(self.element.discoveredBy!.capitalized)
                            }
                        }
                        
                        if self.element.namedBy != nil {
                            Group {
                                Text("named by")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                                Text(self.element.namedBy!.capitalized)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("learn more")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category] ?? Color.black))
                        Button(action: {
                            guard let url = URL(string: self.element.source) else {return}
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Text(self.element.source)
                                Image(systemName: "arrow.up.right.square")
                                    .padding(0)
                            }
                        }
                        .padding(.bottom)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            }
            
        }
        .navigationBarTitle(Text(self.element.name), displayMode: .inline)
    }
}

struct ElementView_Previews: PreviewProvider {
    static var previews: some View {
        ElementView(element: ElementsModel().elements[30])
    }
}
