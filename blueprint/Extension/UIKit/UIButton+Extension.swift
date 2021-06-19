//
//  UIButton+Extension.swift
//  blueprint
//
//  Created by DatNguyen on 17/06/2021.
//

import UIKit

extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
        self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                            left: -insetAmount*factor,
                                            bottom: 0,
                                            right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                            left: insetAmount*factor,
                                            bottom: 0,
                                            right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    func applyGradient(colors: [CGColor],
                       startPoint: CGPoint = CGPoint(x: 0, y: 0),
                       endPoint: CGPoint = CGPoint(x: 1, y: 0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.frame.size.height / 2
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
