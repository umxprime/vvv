//
//  ValueExpression.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

class ValueExpression {
    private var value: Int = 0
    var isBound: Bool = false
}

extension ValueExpression : Expression {
    var description: String {
        return value.description
    }
    
    func evaluate(context: ExpressionContext) -> Int {
        return value
    }
    
    func bind(operands:[Any]) {
        guard let value = operands.first as? Int else {return}
        self.value = value
        isBound = true
    }
}
