//
//  UIColor.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import Foundation
import UIKit

extension UIColor {
    public struct Asset {
        public static let primary = UIColor.systemTeal
        
        static var gradientDarkGrey: UIColor {
            return UIColor(red: 239 / 255.0, green: 241 / 255.0, blue: 241 / 255.0, alpha: 1)
        }
        
        static var gradientLightGrey: UIColor {
            return UIColor(red: 201 / 255.0, green: 201 / 255.0, blue: 201 / 255.0, alpha: 1)
        }
    }
}
