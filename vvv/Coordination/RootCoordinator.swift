//
//  RootCoordinator.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

protocol RootCoordinator: Coordinating {
    
}

class DefaultRootCoordinator {
    private var activityCoordinator: Coordinating?
    private let coordinationFactory: CoordinationFactory
    private let scenesFactory: ScenesFactory
    private let window: UIWindow
    init(coordinationFactory: CoordinationFactory,
         window: UIWindow,
         scenesFactory: ScenesFactory) {
        self.window = window
        self.scenesFactory = scenesFactory
        self.coordinationFactory = coordinationFactory
    }
}

extension DefaultRootCoordinator : RootCoordinator {
    
}

extension DefaultRootCoordinator : Coordinating {
    func enter() {
        
    }
    
    func exit() {
        activityCoordinator?.exit()
    }
    
    func coordinate(with action: Coordination.Action) {
        switch action {
        case .Launch:
            activityCoordinator = self.coordinationFactory.activity(window: window, scenesFactory: scenesFactory)
            activityCoordinator?.enter()
        }
    }
}
