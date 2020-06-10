//
//  UpdateManager.swift
//  Instructions
//
//  Created by Lorenzo Lewis on 6/7/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import Foundation

struct UpdateManager {
    
    init() {
        version()
    }
    
    // Decide version
    func version() {
        let version = readDefaultsVersion()
        
        log.info("Current app version: \(String(describing: version))")
        
        switch version {
        case "1.0":
            from1_0()
        default:
            break
        }
        
        setDefaultsVersion()
    }
    
    // MARK: Upgrade functions
    func from1_0() {
    }
    
    // Read version from defaults
    func readDefaultsVersion() -> String? {
        let version = UserDefaults.standard.object(forKey: "AppVersion") as? String
        return version
    }
    
    // Write current version
    func setDefaultsVersion() {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        UserDefaults.standard.set(version, forKey: "AppVersion")
        
        log.info("Saved version \(String(describing: version)) to defaults")
    }
}
