//
//  ElementsModel.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/2/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ElementsModel {
    
    let elements: [Element]
    var categories: [String] {
        
        var array = [String]()
        
        for element in elements {
            if !array.contains(element.category) {
                array.append(element.category)
            }
        }
        print(array)
        return array
    }
    
    init() {
        let url = Bundle.main.url(forResource: "PeriodicTableJSON", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = try! decoder.decode(ElementsArray.self, from: data)
        elements = jsonData.elements
    }
    
    var filteredElements: [Element] {
        switch categories {
        default:
            return elements.filter { $0.category == "" }
        }
    }
}

func formatElectronConfiguration(_ electronConfiguration: String) -> String {
    var formatted = electronConfiguration
    let unicodeDictionary = [
        0 : "\u{2070}",
        1 : "\u{00B9}",
        2 : "\u{00B2}",
        3 : "\u{00B3}",
        4 : "\u{2074}",
        5 : "\u{2075}",
        6 : "\u{2076}",
        7 : "\u{2077}",
        8 : "\u{2078}",
        9 : "\u{2079}"
    ]    
    
    for int in 0...9 {
        let regexSecondDigit = try! NSRegularExpression(pattern: String("\(int)" + #"(?=[\s]|$)"#))
        formatted = regexSecondDigit.stringByReplacingMatches(in: formatted,  range: NSRange(0..<formatted.utf16.count), withTemplate: unicodeDictionary[int]!)
        
        let regexFirstDigit = try! NSRegularExpression(pattern: String("(?<=[a-z])" + "\(int)"))
        formatted = regexFirstDigit.stringByReplacingMatches(in: formatted,  range: NSRange(0..<formatted.utf16.count), withTemplate: unicodeDictionary[int]!)
    }
    
    return formatted
}

let elementColor: [String : Color] = [
    "diatomic non-metal" : Color(hex: "F28B5C"),
    "noble gas" : Color("nobleGasses"),
    "alkali metal" : Color("alkaliMetals"),
    "alkaline earth metal" : Color("alkalineEarthMetals"),
    "metalloid" : Color(hex: "EF5050"),
    "polyatomic non-metal" : Color(hex: "EA4F4F"),
    "post-transition metal" : Color(hex: "87C273"),
    "transition metal" : Color("transitionMetals"),
    "lanthanide" : Color("lanthanoids"),
    "actinide" : Color("actinoids"),
    "unknown, probably transition metal" : Color("transitionMetals"),
    "unknown, probably post-transition metal" : Color(hex: "87C273"),
    "unknown, probably metalloid" : Color(hex: "EF5050"),
    "unknown, predicted to be noble gas" : Color("nobleGasses"),
    "unknown, but predicted to be an alkali metal" : Color("alkaliMetals")
]

public struct ElementsArray: Decodable {
    public var elements: [Element]
}

public struct Element: Decodable, Identifiable {
    public let id = UUID()
    let name: String
    let appearance: String?
    let atomicMass: Double?
    let boil: Double?
    let category: String
    let color: String?
    let density: Double?
    let discoveredBy: String?
    let melt, molarHeat: Double?
    let namedBy: String?
    let number, period: Int
    let phase: Phase
    let source: String
    let spectralImg: String?
    let summary, symbol: String
    let xpos, ypos: Int
    let shells: [Int]
    let electronConfiguration: String?
    let electronAffinity, electronegativityPauling: Double?
    let ionizationEnergies: [Double]?
    let electronConfigurationSemantic: String?
}

enum Phase: String, Decodable {
    case gas, Gas
    case liquid, Liquid
    case solid, Solid
}


