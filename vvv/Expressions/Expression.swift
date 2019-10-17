//
//  Expression.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol Expression : CustomStringConvertible {
    func evaluate(context:ExpressionContext) -> Int
    func bind(operands:[Any]) -> Void
    var isBound:Bool {get}
}
