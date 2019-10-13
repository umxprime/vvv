//
//  vvvTests.swift
//  vvvTests
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import XCTest

class vvvTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let problem:Expression = BinaryExpression(kind: .Add)
        let lhs = ValueExpression()
        lhs.bind(operands: [1])
        let rhs = ValueExpression()
        rhs.bind(operands: [9])
        problem.bind(operands: [lhs, rhs])
        let result = problem.evaluate(context: DummyExpressionContext())
        XCTAssertEqual(result, 10)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
