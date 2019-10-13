//
//  ActivityStepEntity.swift
//  vvv
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ExpressionContext {
    var variables:[String:Decimal] {get}
}

struct DummyExpressionContext : ExpressionContext {
    var variables: [String : Decimal] = [:]
}

protocol Expression : CustomStringConvertible {
    func evaluate(context:ExpressionContext) -> Int
    func bind(operands:[Any]) -> Void
    var isBound:Bool {get}
}

class ValueExpression : Expression {
    private var value: Int = 0
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
    
    var isBound: Bool = false
}

class BinaryExpression : Expression {
    private var lhs: Expression = ValueExpression()
    private var rhs: Expression = ValueExpression()
    
    func evaluate(context: ExpressionContext) -> Int {
        switch self.kind {
        case .Add:
            return lhs.evaluate(context: context) + rhs.evaluate(context: context)
        }
    }
    
    func bind(operands: [Any]) {
        guard let lhs = operands.first as? Expression else {return}
        guard let rhs = operands[1] as? Expression else {return}
        self.lhs = lhs
        self.rhs = rhs
        isBound = true
    }
    
    var isBound: Bool = false
    
    var description: String {
        switch self.kind {
        case .Add:
            return "\(lhs.description) + \(rhs.description)"
        }
    }
    enum Kind {
        case Add
    }
    let kind: Kind
    init(kind: Kind) {
        self.kind = kind
    }
}

protocol ActivityStepEntity {
    var expression:Expression {get}
}

extension Entities {
    class DefaultActivityStepEntity {
        internal var expression:Expression
        init(expression:Expression) {
            self.expression = expression
        }
    }
}

extension Entities.DefaultActivityStepEntity : ActivityStepEntity {
    
}
