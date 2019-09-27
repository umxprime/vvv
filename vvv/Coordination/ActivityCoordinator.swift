//
//  ActivityCoordinator.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit
protocol ActivityCoordinator : Coordinating{
    
}

class DefaultActivityCoordinator {
    private let coordinationFactory: CoordinationFactory
    private var viewController: UIViewController?
    private let window: UIWindow
    private let scenesFactory: ScenesFactory
    init (window: UIWindow, coordinationFactory: CoordinationFactory, scenesFactory: ScenesFactory) {
        self.window = window
        self.scenesFactory = scenesFactory
        self.coordinationFactory = coordinationFactory
    }
}

extension DefaultActivityCoordinator: ActivityCoordinator {
    
}

extension DefaultActivityCoordinator: Coordinating {
    func enter() {
        viewController = scenesFactory.activity()
        window.rootViewController = viewController
    }
    
    func coordinate(with action: Coordination.Action) {
        
    }
    
    func exit() {
        
    }
    
    
}
