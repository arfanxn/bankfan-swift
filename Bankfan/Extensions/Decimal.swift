//
//  Decimal.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 02/01/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
