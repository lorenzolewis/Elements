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
                    
                    // Group and Electronegativity
                    // TODO: Align, start w/ hstack, then vstack
                    HStack {
                        VStack(alignment: .leading) {
                            Text("group")
                                .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                            Text("\(self.element.xpos)")
                            
                            VStack(alignment: .leading) {
                                Text("phase")
                                    .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                Text(self.element.phase.rawValue)
                            }
                        }
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            if self.element.electronegativityPauling != nil {
                                VStack(alignment: .leading) {
                                    Text("e. negativity")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                    Text(String(format: "%g", self.element.electronegativityPauling!))
                                }
                                
                            }
                            if self.element.melt != nil {
                                VStack(alignment: .leading) {
                                    Text("melt point")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                    Text(formatTemperature(self.element.melt!))
                                }
                            }
                        }
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            if self.element.density != nil {
                                VStack(alignment: .leading) {
                                    Text("density")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                                    Text(String(format: "%g", self.element.density!) + " g/L")
                                }
                            }
                            if self.element.boil != nil {
                                VStack(alignment: .leading) {
                                    Text("boil point")
                                        .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
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
                        
                        Text("electron configuration")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                        
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
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
                        Text(self.element.summary)
                    }
                    
                    Group {
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
                    }
                    
                    VStack(alignment: .leading) {
                        Text("learn more")
                            .modifier(ElementInfoHeading(color: elementColor[self.element.category]!))
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

func createGroupModel(_ element: Element) -> [GroupModel] {
    var groupModel = [GroupModel]()
    
    groupModel.append(GroupModel(title: "State", value: element.phase.rawValue))
    
    if let boil = element.boil {
        groupModel.append(GroupModel(title: "Boil", value: String(format: "%g", boil)))
    }
    
    if let melt = element.melt {
        groupModel.append(GroupModel(title: "Melt", value: String(format: "%g", melt)))
    }
    
    if let molarHeat = element.molarHeat {
        groupModel.append(GroupModel(title: "Molar Heat", value: String(format: "%g", molarHeat) + " J/mol·K"))
    }
    
    if let density = element.density {
        groupModel.append(GroupModel(title: "Density", value: String(format: "%g", density) + " g/L"))
    }
    
    //electronaffinity
    //elecronegativitypualing
    
    return groupModel
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
        ], electronConfigurationSemantic: "s1s"))
    }
}
