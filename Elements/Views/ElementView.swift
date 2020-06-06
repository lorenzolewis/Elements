//
//  ElementView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/3/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ElementView: View {
    
    let element: Element
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        PeriodicSquareView(element: self.element, geo: geo)
                        VStack(alignment: .leading) {
                            Text(self.element.name)
                                .bold()
                                .modifier(OneLineText())
                                .foregroundColor(elementColor[self.element.category])
                                .font(.largeTitle)
                            Text(self.element.category.capitalized)
                        }
                    }
                    
                    HStack {
                        if self.element.melt != nil {
                            VStack(alignment: .leading) {
                                Text("melting point")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                Text("\(self.element.melt!, specifier: "%.2f") °K")
                            }
                            Spacer()
                        }
                        
                        if self.element.boil != nil {
                            VStack(alignment: .leading) {
                                Text("boiling point")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                Text("\(self.element.boil!, specifier: "%.2f") °K")
                            }
                            Spacer()
                        }
                        if self.element.molarHeat != nil {
                            VStack(alignment: .leading) {
                                Text("molar heat")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                Text("\(self.element.molarHeat!, specifier: "%.2f") J/mol·K")
                            }
                            Spacer()
                        }
                        
                    }
                    
                    if self.element.appearance != nil {
                        Group {
                            Text("appearance")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text(self.element.appearance!.capitalizingFirstLetter())
                        }
                    }
                    
                    if self.element.color != nil {
                        Group {
                            Text("color")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text(self.element.color!.capitalized)
                        }
                    }
                    
                    if self.element.electronConfiguration != nil {
                        Group {
                            Text("electron configuration")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text(formatElectronConfiguration(self.element.electronConfiguration!))
                        }
                    }
                    
                    Group {
                        Text("summary")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                        Text(self.element.summary)
                    }
                    
                    if self.element.discoveredBy != nil {
                        Group {
                            Text("discovered by")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text(self.element.discoveredBy!.capitalized)
                        }
                    }
                    
                    if self.element.namedBy != nil {
                        Group {
                            Text("named by")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text(self.element.namedBy!.capitalized)
                        }
                    }
                    
                    Group {
                        Text("learn more")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                        Text(self.element.source)
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                
                
            }
            .padding()
        }
        
        // Numbers
        //        GeometryReader { geo in
        //            HStack {
        //                Spacer()
        //                if (self.element.atomicMass != nil) {
        //                    ElementViewPill(description1: "atomic",
        //                                    description2: "weight",
        //                                    value: String(self.element.atomicMass!),
        //                                    color: self.backgroundColor)
        //                    Spacer()
        //                    Divider()
        //                        .frame(maxHeight: geo.size.height * 0.5)
        //                    Spacer()
        //                }
        //
        //                ElementViewPill(description1: "Phase",
        //                                description2: nil,
        //                                value: self.element.phase.rawValue,
        //                                color: self.backgroundColor)
        //                Spacer()
        //                // melting point
        //                // boiling point
        //            }
        //        }
        //
        //        VStack(alignment: .leading) {
        //            Text("room temp state")
        //                .modifier(ElementInfoHeading(color: self.backgroundColor))
        //            Text(String(self.element.phase.rawValue).capitalized)
        //        }
        //        VStack(alignment: .leading) {
        //            Text("category")
        //                .modifier(ElementInfoHeading(color: self.backgroundColor))
        //            Text(String(self.element.category).capitalized)
        //        }
        //
        //
        //
        //        // People
        //        HStack {
        //            if (self.element.discoveredBy != nil) {
        //                VStack(alignment: .leading) {
        //                    Text("discovered by")
        //                        .modifier(ElementInfoHeading(color: self.backgroundColor))
        //                    Text(self.element.discoveredBy!)
        //                }
        //            }
        //
        //            Spacer()
        //
        //            if (self.element.namedBy != nil) {
        //                VStack(alignment: .leading) {
        //                    Text("named by")
        //                        .modifier(ElementInfoHeading(color: self.backgroundColor))
        //                    Text(self.element.namedBy!)
        //                }
        //            }
        //            Spacer()
        //        }
        //
        //        // Categorization
        //        HStack {
        //
        //            if (self.element.appearance != nil) {
        //                VStack(alignment: .leading) {
        //                    Text("color")
        //                        .modifier(ElementInfoHeading(color: self.backgroundColor))
        //                    Text(String(self.element.appearance!).capitalized)
        //                }
        //            }
        //            Spacer()
        //        }
        //
        //
        //
        //        Group {
        //
        //            if (self.element.boil != nil) {
        //                Text("Boiling Point")
        //                    .modifier(ElementInfoHeading(color: self.backgroundColor))
        //                Text("\(self.element.boil!)")
        //            }
        //
        //            if (self.element.color != nil) {
        //                Text(self.element.color!)
        //            }
        //            if (self.element.density != nil) {
        //                Text("\(self.element.density!)")
        //            }
        //
        //
        //            if (self.element.molarHeat != nil) {
        //                Text("\(self.element.molarHeat!)")
        //            }
        //        }
        //        Group {
        //            if (self.element.electronConfiguration != nil) {
        //                Text(self.element.electronConfiguration!)
        //            }
        //            if (self.element.electronAffinity != nil) {
        //                Text("\(self.element.electronAffinity!)")
        //            }
        //            if (self.element.electronegativityPauling != nil) {
        //                Text("\(self.element.electronegativityPauling!)")
        //            }
        //        }
        //
        //        Group {
        //            Text("summary")
        //                .modifier(ElementInfoHeading(color: self.backgroundColor))
        //            Text(self.element.summary)
        //            Text("source")
        //                .modifier(ElementInfoHeading(color: self.backgroundColor))
        //            Text(self.element.source)
        //        }
        //    }
        //    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        //    .padding()
        //}
        //    }
    }
}

struct ElementViewPill: View {
    
    let description1: String
    let description2: String?
    let value: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title)
            Text(description1)
                .foregroundColor(color)
            if description2 != nil {
                Text(description2!)
                    .foregroundColor(color)
            }
        }
        .font(Font.body.smallCaps())
        
    }
}

struct ElementView_Previews: PreviewProvider {
    static var previews: some View {
        ElementView(element: Element(name: "Oxygen",
                                     appearance: "beautiful mustard gas",
                                     atomicMass: 15.999,
                                     boil: 90.188,
                                     category: "diatomic nonmetal but I like to be complicated",
                                     color: "yellow",
                                     density: 1.429,
                                     discoveredBy: "Carl Wilhelm Scheele",
                                     melt: 54.36,
                                     molarHeat: nil,
                                     namedBy: "Antoine Lavoisier",
                                     number: 8,
                                     period: 2,
                                     phase: .Gas,
                                     source: "https://en.wikipedia.org/wiki/Oxygen",
                                     spectralImg: "https://en.wikipedia.org/wiki/File:Oxygen_spectre.jpg",
                                     summary: "Oxygen is a chemical but I'm not going to stop there because I need to test how many lines I can fit into this baby while keeping it still beautiful and pristine!",
                                     symbol: "O",
                                     xpos: 16,
                                     ypos: 2,
                                     shells: [2, 6],
                                     electronConfiguration: "1s2 2s2 2p4",
                                     electronAffinity: 140.9760,
                                     electronegativityPauling: 3.44,
                                     ionizationEnergies: [
                                        1313.9,
                                        3388.3,
                                        5300.5,
                                        7469.2,
                                        10989.5,
                                        13326.5,
                                        71330,
                                        84078.0
        ]))
    }
}
