//
//  UITouch+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import UIKit

extension UITouch {
    
    public func didTapAttributedText(in label: UILabel, at point: CGPoint, inRange targetRange: NSRange) -> Bool {
        guard let attributedText = label.attributedText else {
            return false
        }
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        
        let locationOfTouchInTextContainer = CGPoint(x: point.x, y: point.y)
        let indexOfCharacter = layoutManager.characterIndex(
            for: locationOfTouchInTextContainer,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
