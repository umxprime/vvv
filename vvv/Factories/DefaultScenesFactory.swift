//
//  DefaultScenesFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

class DefaultScenesFactory {
    
}

extension DefaultScenesFactory : ScenesFactory {
    func ready(controllable:ReadySceneControllableCoordinator) -> UIViewController {
        let viewController = DefaultReadySceneView(nibName: nil, bundle: nil)
        let presenter = DefaultReadyScenePresenter(view: viewController)
        let interactor = DefaultReadySceneInteractor(presenter: presenter)
        let controller = DefaultReadySceneController(controllable: controllable, interactor:interactor)
        viewController.configure(controller: controller)
        return viewController
    }
    
    func activity() -> UIViewController {
        let viewController = DefaultActivitySceneView(nibName: nil, bundle: nil)
        let presenter = DefaultActivityScenePresenter(view: viewController)
        let interactor = DefaultActivitySceneInteractor(presenter: presenter, activitiesFactory: DefaultActivitiesFactory())
        let controller = DefaultActivitySceneController(interactor: interactor)
        viewController.configure(controller: controller)
        return viewController
    }
}
