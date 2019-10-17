//
//  Expression.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation


struct ExpressionSetup {
    let format:String
    let arguments:[Any]
}

protocol Expression : CustomStringConvertible {
    func evaluate() -> Int
}

class DefaultExpression {
    let setup: ExpressionSetup
    let expression: NSExpression
    init(setup:ExpressionSetup) {
        self.setup = setup
        expression = NSExpression(format: setup.format, argumentArray: setup.arguments)
    }
}

extension DefaultExpression : Expression {
    var description: String {
        return String(format: setup.format, arguments: setup.arguments as! [CVarArg])
    }
    
    func evaluate() -> Int {
        return expression.expressionValue(with: nil, context: nil) as? Int ?? 0
    }
}
