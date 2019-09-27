//
//  DefaultCoordinationFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

class DefaultCoordinationFactory {
    
}

extension DefaultCoordinationFactory : CoordinationFactory {
    func activity(window: UIWindow, scenesFactory: ScenesFactory) -> ActivityCoordinator {
        return DefaultActivityCoordinator(window: window, coordinationFactory: self, scenesFactory: scenesFactory)
    }
    
    func root(window: UIWindow, scenesFactory: ScenesFactory) -> RootCoordinator {
        return DefaultRootCoordinator(
            coordinationFactory: self,
            window: window,
            scenesFactory: scenesFactory
        )
    }
    
    func dummy() -> DummyCoordinator {
        return DefaultDummyCoordinator()
    }
}
