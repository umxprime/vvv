//
//  BinaryExpression.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

class BinaryExpression {
    private var lhs: Expression = ValueExpression()
    private var rhs: Expression = ValueExpression()
    var isBound: Bool = false
    enum Kind {
        case Add
    }
    let kind: Kind
    init(kind: Kind) {
        self.kind = kind
    }
}

extension BinaryExpression : Expression {
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
    
    var description: String {
        switch self.kind {
        case .Add:
            return "\(lhs.description) + \(rhs.description)"
        }
    }
}
