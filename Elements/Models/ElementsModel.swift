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
    
    let argon = "1s2 2s2 2p6 3s2 3p6 "
    let krypton = argon + "3d10 4s2 4p6 "
    let xenon = krypton + "4d10 5s2 5p6 "
    let radon = xenon + "4f14 5d10 6s2 6p6 "
    
    while formatted.starts(with: radon) {
        formatted = formatted.replacingOccurrences(of: argon, with: "[Rn] ")
    }
    
    while formatted.starts(with: xenon) {
        formatted = formatted.replacingOccurrences(of: argon, with: "[Xe] ")
    }
    
    while formatted.starts(with: krypton) {
        formatted = formatted.replacingOccurrences(of: argon, with: "[Kr] ")
    }
    
    while formatted.starts(with: argon) {
        formatted = formatted.replacingOccurrences(of: argon, with: "[Ar] ")
    }
    
    
    for int in 0...9 {
        let regexFirstDigit = try! NSRegularExpression(pattern: String("(?<=[a-z])" + "\(int)"))
        formatted = regexFirstDigit.stringByReplacingMatches(in: formatted,  range: NSRange(0..<formatted.utf16.count), withTemplate: unicodeDictionary[int]!)
        
        let regexSecondDigit = try! NSRegularExpression(pattern: String(#"(?<=[a-z]\d)"# + "\(int)"))
        formatted = regexSecondDigit.stringByReplacingMatches(in: formatted,  range: NSRange(0..<formatted.utf16.count), withTemplate: unicodeDictionary[int]!)
    }
    
    return formatted
}

let elementColor: [String:Color] = [
    "diatomic nonmetal" : Color(hex: "174255"),
    "noble gas" : Color(hex: "187170"),
    "alkali metal" : Color(hex: "199889"),
    "alkaline earth metal" : Color(hex: "35AC79"),
    "metalloid" : Color(hex: "69C34A"),
    "polyatomic nonmetal" : Color(hex: "EDBB3E"),
    "post-transition metal" : Color(hex: "EF953C"),
    "transition metal" : Color(hex: "F26D2F"),
    "lanthanide" : Color(hex: "ED512B"),
    "actinide" : Color(hex: "EF6746"),
    "unknown, probably transition metal" : Color(hex: "EE7841"),
    "unknown, probably post-transition metal" : Color(hex: "EC9B49"),
    "unknown, probably metalloid" : Color(hex: "77B562"),
    "unknown, predicted to be noble gas" : Color(hex: "1F6F6E"),
    "unknown, but predicted to be an alkali metal" : Color(hex: "21988A")
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
}

enum Phase: String, Decodable {
    case gas, Gas
    case liquid, Liquid
    case solid, Solid
}


