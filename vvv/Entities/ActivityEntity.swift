//
//  ActivityEntity.swift
//  vvv
//
//  Created by Maxime CHAPELET on 30/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivityEntity {
    var steps:[ActivityStepEntity] {get}
}

extension Entities {
    class DefaultActivityEntity {
        let steps:[ActivityStepEntity]
        init(steps:[ActivityStepEntity]) {
            self.steps = steps
        }
    }
}

extension Entities.DefaultActivityEntity : ActivityEntity {
    
}
