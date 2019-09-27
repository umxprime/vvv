//
//  CoordinationFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinationFactory {
    func root(window: UIWindow, scenesFactory: ScenesFactory) -> RootCoordinator
    func activity(window: UIWindow, scenesFactory: ScenesFactory) -> ActivityCoordinator
    func dummy() -> DummyCoordinator
}
