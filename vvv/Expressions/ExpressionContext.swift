//
//  ExpressionContext.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ExpressionContext {
    var variables:[String:Decimal] {get}
}

struct DummyExpressionContext : ExpressionContext {
    var variables: [String : Decimal] = [:]
}
