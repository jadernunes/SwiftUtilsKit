//
//  UIFont+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import UIKit

public extension UIFont {
    
    static let defaultFont: UIFont = .systemFont(ofSize: 17, weight: .regular)
    
    /// Use the font informed in the info.plist file. The default value is: *.systemFont(ofSize: 17, weight: .regular)*
    /// - Parameters:
    ///   - family: it's the Font's name.
    ///   - size: Font's size.
    /// - Returns: new font.
    static func custom(family: String, size: CGFloat, defaultFont: UIFont = defaultFont) -> UIFont {
        UIFont(name: family, size: size) ?? defaultFont
    }
}
