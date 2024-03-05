//
//  UIView+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import UIKit

public enum ColorFlow {
    case leftRight, rightLeft, topDown, bottomUp
}

extension UIView {
    
    /// Transform the view as a circle: *height / 2*
    /// - Returns: The view itself.
    @discardableResult
    public func clipAsCircle() -> UIView {
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
        return self
    }
    
    @discardableResult
    public func cornerRadius(value: CGFloat) -> UIView {
        clipsToBounds = true
        layer.cornerRadius = value
        return self
    }
    
    @discardableResult
    public func cornerRadius(radius: CGFloat, cornerMask: CACornerMask) -> UIView {
        clipsToBounds = false
        layer.cornerRadius = radius
        layer.maskedCorners = cornerMask
        return self
    }
    
    @discardableResult
    public func configureBorder(color: UIColor = UIColor.lightGray,
                                                   thickness: CGFloat = 0.5,
                                                   cornerRadius: CGFloat = 0) -> UIView {
        layer.borderColor = color.cgColor
        layer.borderWidth = thickness
        layer.cornerRadius = cornerRadius
        return self
    }
    
    /// Add shadown to any UIView
    /// - Parameters:
    ///   - color: Default is: *.black*
    ///   - opacity: Default is: *0.2*
    ///   - shadowRadius: Default is: *2.0*
    ///   - offset: Default is: *width: -0.05 and height: 0.05*
    ///   - cornerRadius: Default is: *4*
    /// - Returns: The view itself
    @discardableResult
    public func addShadow(color: UIColor = .black,
                                             opacity: Float = 0.2,
                                             shadowRadius: CGFloat = 2,
                                             offset: CGSize = .init(width: -0.05, height: 0.05),
                                             cornerRadius: CGFloat = 4) -> UIView  {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        return self
    }
}

// MARK: - Gradient

public extension UIView {
    
    /// Used to add a gradient color on the view. You should've to pass the value in the same order as you expected to see.
    /// - Parameter colors: List of UIColor.
    @discardableResult
    func addGradient(colors: [UIColor], flow: ColorFlow = .leftRight) -> UIView {
        let gradient = CAGradientLayer()
        
        let points = createGradientPoints(flow)
        gradient.startPoint = points.start
        gradient.endPoint = points.end
        gradient.locations = [0.0, 1.0]
        gradient.colors = colors.map({ $0.cgColor })
        gradient.frame = CGRect(x: 0.0,
                                y: 0.0,
                                width: frame.size.width,
                                height: frame.size.height)
        layer.insertSublayer(gradient, below: layer.sublayers?.last)
        return self
    }
    
    private func createGradientPoints(_ flow: ColorFlow) -> (start: CGPoint, end: CGPoint) {
        switch flow {
        case .leftRight:
            return (start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 1.0))
        case .rightLeft:
            return (start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 0.0, y: 1.0))
        case .topDown:
            return (start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 0.0, y: 1.0))
        case .bottomUp:
            return (start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0))
        }
    }
}
