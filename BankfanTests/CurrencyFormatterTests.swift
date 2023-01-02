//
//  CurrencyFormatterTest.swift
//  BankfanTests
//
//  Created by Muhammad Arfan on 02/01/23.
//

import Foundation
import UIKit
import XCTest

@testable import Bankfan

class CurrencyFormatterTests : XCTestCase {
    
    var formatter : CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        self.formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents () {
        let result = formatter.breakIntoDollarsAndCents(1234.56)
        XCTAssertEqual(result.0, "1,234")
        XCTAssertEqual(result.1, "56")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }

    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
    
}
 
