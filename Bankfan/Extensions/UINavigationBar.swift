//
//  UINavigationBar.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 01/01/23.
//

import Foundation
import UIKit

extension UINavigationBar {
    public func hideLine () {
        let img = UIImage()
        self.shadowImage = img
        self.setBackgroundImage(img, for: .default)
        self.isTranslucent = false
    }
}
