//
//  UITextField+Extension.swift
//  blueprint
//
//  Created by DatNguyen on 17/06/2021.
//

import UIKit

extension UITextField {
    var isBlank: Bool {
        let text = self.text ?? ""
        return text.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func setPlaceHolderColor(with color: UIColor,
                             text: String = "",
                             font: UIFont = UIFont.systemFont(ofSize: 14)
    ) {
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes: [
                                                       NSAttributedString.Key.foregroundColor: color,
                                                       NSAttributedString.Key.font: font
                                                   ])
    }

    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }

    func setRightPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
}
