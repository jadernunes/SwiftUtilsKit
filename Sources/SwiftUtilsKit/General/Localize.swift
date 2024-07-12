//
//  Localize.swift
//
//
//  Created by Jader Nunes on 2024-03-05.
//

import Foundation

@available(*, deprecated, message: "We launched a new powerful lib to work with strings: https://github.com/jadernunes/LocalizeKit. We'll be remove this function on v1.3.0")
public struct Localize {
    
    static func string(key: String, bundle: Bundle = .main) -> String {
        let textLocalised = NSLocalizedString(key, bundle: bundle, comment: "")
        return key == textLocalised ? "---" : textLocalised
    }
}
