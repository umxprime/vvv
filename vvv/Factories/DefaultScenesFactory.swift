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
    func ready(controllable:ReadySceneControllable) -> UIViewController {
        let viewController = DefaultReadySceneView(nibName: nil, bundle: nil)
        let presenter = DefaultReadyScenePresenter(view: viewController)
        let dispatcher = DefaultDispatcher()
        dispatcher.bind(event: ReadyScene.Events.OnLoadEvent, interactor: ReadySceneLoadInteractor(presenter: presenter))
        let controller = DefaultReadySceneController(controllable: controllable, dispatcher: dispatcher)
        viewController.configure(controller: controller)
        return viewController
    }
    
    func activity() -> UIViewController {
        let viewController = ActivitySceneView(nibName: nil, bundle: nil)
        return viewController
    }
}
