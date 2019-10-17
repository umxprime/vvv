//
//  vvvTests.swift
//  vvvTests
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import XCTest

class ExpressionsTests: XCTestCase {
    func testExpressionBuilder() {
        let setup = ExpressionSetup(format: "%i+%i", arguments: [10,10])
        let expression = DefaultExpression(setup: setup)
        XCTAssertEqual(expression.evaluate(), 20)
    }
}
