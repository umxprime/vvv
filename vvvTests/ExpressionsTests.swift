//
//  vvvTests.swift
//  vvvTests
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import XCTest

class ExpressionsTests: XCTestCase {
    func testAdditionOnePlusNineEqualTen() {
        let problem:Expression = BinaryExpression(kind: .Add)
        let lhs = ValueExpression()
        lhs.bind(operands: [1])
        let rhs = ValueExpression()
        rhs.bind(operands: [9])
        problem.bind(operands: [lhs, rhs])
        let result = problem.evaluate(context: DummyExpressionContext())
        XCTAssertEqual(result, 10)
    }
    
    func testAdditionOnePlusNinePlusTenEqualTwenty() {
        let problem:Expression = BinaryExpression(kind: .Add)
        let firstExpression:Expression = BinaryExpression(kind: .Add)
        let firstNumber = ValueExpression()
        let secondNumber = ValueExpression()
        let thirdNumber = ValueExpression()
        firstNumber.bind(operands: [1])
        secondNumber.bind(operands: [9])
        thirdNumber.bind(operands: [10])
        firstExpression.bind(operands: [firstNumber, secondNumber])
        problem.bind(operands: [firstExpression, thirdNumber])
        let result = problem.evaluate(context: DummyExpressionContext())
        XCTAssertEqual(result, 20)
    }
}
