//
//  UIViewExtension.swift
//  blueprint
//
//  Created by DatNguyen on 15/06/2021.
//

import Foundation
import UIKit

extension UIView {
    func addCornerRadius(radius: CGFloat = 6) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    func addBorder(color: UIColor, borderWidth: CGFloat = 1) {
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
    }

    func setShadow(
        color: UIColor = UIColor.black.withAlphaComponent(0.1),
        shadowOffset: CGSize = CGSize(width: 0, height: 1),
        shadowOpacity: Float = 1,
        shadowRadius: CGFloat = 6,
        cornerRadius: CGFloat = 6
    ) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat = 6.0) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func roundEdges(_ edges: UIRectEdge, radius: CGFloat = 6.0) {
        var corners: UIRectCorner = []
        if edges.contains(.top) {
            corners.insert([.topLeft, .topRight])
        }
        if edges.contains(.bottom) {
            corners.insert([.bottomRight, .bottomLeft])
        }
        if edges.contains(.left) {
            corners.insert([.topLeft, .bottomLeft])
        }
        if edges.contains(.right) {
            corners.insert([.bottomRight, .topRight])
        }
        roundCorners(corners, radius: radius)
    }

    func setGradientBackground(colorTop: UIColor,
                               colorBottom: UIColor,
                               startPoint: CGPoint,
                               endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func generateGradientBackground(colorTop: UIColor,
                                    colorBottom: UIColor,
                                    startPoint: CGPoint,
                                    endPoint: CGPoint,
                                    cornerRadius: CGFloat = 6.0) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        return gradientLayer
    }
}
