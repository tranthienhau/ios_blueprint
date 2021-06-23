//
//  UIColorExtension.swift
//  blueprint
//
//  Created by DatNguyen on 15/06/2021.
//

import UIKit

public extension UIColor {
    // swiftlint:disable all
    convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        var hex = hexString
        if !hexString.hasPrefix("#") {
            hex = "#" + hexString
        }
        let start = hex.index(hexString.startIndex, offsetBy: 1)
        var hexColor = String(hex[start...])
        if hexColor.count == 6 {
            hexColor += "FF"
        }
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x0000_00FF) / 255
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        self.init(red: 1, green: 0, blue: 0, alpha: 1.0)
    }
    // swiftlint:enable all
}
