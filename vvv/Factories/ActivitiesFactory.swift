//
//  ActivitiesFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 17/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivitiesFactory {
    func create(count:UInt, setup:()->ExpressionSetup) -> ActivityEntity
}

class DefaultActivitiesFactory {
    
}

extension DefaultActivitiesFactory : ActivitiesFactory {
    func create(count: UInt, setup: () -> ExpressionSetup)  -> ActivityEntity {
        var steps = [ActivityStepEntity]()
        for _ in 0..<count {
            let expression = DefaultExpression(setup: setup())
            let step = Entities.DefaultActivityStepEntity(expression: expression)
            steps.append(step)
        }
        return Entities.DefaultActivityEntity(steps: steps)
    }
}
