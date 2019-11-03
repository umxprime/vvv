//
//  TestNonReapeatingNumberGenerator.swift
//  vvvTests
//
//  Created by Maxime CHAPELET on 03/11/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import XCTest

class TestNonRepeatingNumberGenerator: XCTestCase {
    func testThousandNonRepeatingNumbersFrom1To5() {
        let generator = DefaultNonRepeatingNumberGenerator()
        generator.configure(min: 1, max: 5)
        var previousValue = 0
        for _ in 1...1000 {
            let value = generator.next()
            XCTAssertNotEqual(value, previousValue)
            previousValue = value
        }
    }
    func testThousandNonRepeatingNumbersFrom1To20() {
        let generator = DefaultNonRepeatingNumberGenerator()
        generator.configure(min: 1, max: 20)
        var previousValue = 0
        for _ in 1...1000 {
            let value = generator.next()
            XCTAssertNotEqual(value, previousValue)
            previousValue = value
        }
    }
}
