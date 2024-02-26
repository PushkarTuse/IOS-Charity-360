//
//  UIView+Extensions.swift
//  charity360
//
//  Created by user1 on 24/02/24.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
