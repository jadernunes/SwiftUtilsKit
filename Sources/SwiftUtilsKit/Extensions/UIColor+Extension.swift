//
//  UIColor+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import UIKit

public extension UIColor {
    
    /// You should've the symbol: # in the beginning
    /// - Parameter hex: The hexadecimal with # with 6 digts, e.g.: #AABBCC
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        let hex = hex.hasPrefix("#") ? hex : ("#" + hex)
        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])
        
        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
                g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
                b = CGFloat(hexNumber & 0x0000FF) / 255.0
                a = 1.0
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        return nil
    }
}
