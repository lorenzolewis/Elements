//
//  ElementsModel.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/2/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

public struct Element: Decodable, Identifiable {
    public let id = UUID()
    let name: String
    let appearance: String?
    let atomicMass: Double
    let boil: Double?
    let category: String
    let color: String?
    let density: Double?
    let discoveredBy: String?
    let melt, molarHeat: Double?
    let namedBy: String?
    let number, period: Int
    let phase: String
    let source: String
    let spectralImg: String?
    let summary, symbol: String
    let xpos, ypos: Int
    let shells: [Int]
    let electronConfiguration: String?
    let electronAffinity, electronegativityPauling: Double?
    let ionizationEnergies: [Double]?
    var electronConfigurationSemantic: String?
}

struct ElementsModel {
    
    let elements: [Element]
    
    init() {
        let url = Bundle.main.url(forResource: "PeriodicTableJSON", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = try! decoder.decode(JSONElementsArray.self, from: data)
        elements = formatElectronConfiguration(jsonData.elements)
    }
    
    struct JSONElementsArray: Decodable {
        var elements: [Element]
    }
}

func formatElectronConfiguration(_ elements: [Element]) -> [Element] {
    var elements = elements
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
    
    for (index, element) in elements.enumerated() {
        if var configuration = element.electronConfigurationSemantic {
            for int in 0...9 {
                let regexSecondDigit = try! NSRegularExpression(pattern: String("\(int)" + #"(?=[\s]|$)"#))
                configuration = regexSecondDigit.stringByReplacingMatches(in: configuration,  range: NSRange(0..<configuration.utf16.count), withTemplate: unicodeDictionary[int]!)
                
                let regexFirstDigit = try! NSRegularExpression(pattern: String("(?<=[a-z])" + "\(int)"))
                configuration = regexFirstDigit.stringByReplacingMatches(in: configuration,  range: NSRange(0..<configuration.utf16.count), withTemplate: unicodeDictionary[int]!)
            }
            elements[index].electronConfigurationSemantic = configuration
        }
    }
    return elements
}

func formatTemperature(_ temp: Double) -> String {
    if let unit = UserDefaults.standard.object(forKey: "TempatureUnit") as? Int {
        switch unit {
        case 0:
            return String(temp) + " °K"
        case 1:
            return String(kelvinToCelcius(temp)) + " °C"
        case 2:
            return String(kelvinToFahrenheit(temp)) + " °F"
        default:
            return String(temp) + " °K"
        }
    } else {
        return String(temp) + " °K"
    }
}

private func kelvinToCelcius(_ temp: Double) -> Double {
    return temp - 273.15
}

private func kelvinToFahrenheit(_ temp: Double) -> Double {
    return temp * 1.8 - 459.67
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
