//
//  ReadySceneController.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ReadySceneControllable {
    func didPressReadyButton()
}

protocol ReadySceneController {
    func readyButtonPressed()
    func viewDidLoad()
}

class DefaultReadySceneController {
    let controllable:ReadySceneControllable
    let dispatcher:Dispatcher
    init(controllable:ReadySceneControllable,
         dispatcher:Dispatcher) {
        self.controllable = controllable
        self.dispatcher = dispatcher
    }
}

extension DefaultReadySceneController : ReadySceneController {
    func readyButtonPressed() {
        controllable.didPressReadyButton()
    }
    func viewDidLoad() {
        dispatcher.dispatch(event: ReadyScene.Events.OnLoadEvent)
    }
}
