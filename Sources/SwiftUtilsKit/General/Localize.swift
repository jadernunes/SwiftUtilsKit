//
//  Localize.swift
//
//
//  Created by Jader Nunes on 2024-03-05.
//

import Foundation

public struct Localize {
    
    static func string(key: String, bundle: Bundle = .main) -> String {
        let textLocalised = NSLocalizedString(key, bundle: bundle, comment: "")
        return key == textLocalised ? "---" : textLocalised
    }
}
