//
//  ActivityStepEntity.swift
//  vvv
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

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
