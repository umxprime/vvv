//
//  ActivitySceneDataStructures.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

enum ActivityScene {
    struct Step {
        let problem: String
        let result: String
        let index: Int
        let total: Int
    }
    struct ViewModel {
        struct Step {
            let problem: String
            let result: String
            let paging: String
        }
        let time: String
        let step: Step
        let canStepBackward: Bool
        let canStepForward: Bool
    }
}
