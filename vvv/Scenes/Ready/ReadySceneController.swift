//
//  ReadySceneController.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ReadySceneControllableCoordinator {
    func didPressReadyButton()
}

protocol ReadySceneController {
    func readyButtonPressed()
    func viewDidLoad()
}

class DefaultReadySceneController {
    let controllable:ReadySceneControllableCoordinator
    let interactor:ReadySceneInteractor
    init(controllable:ReadySceneControllableCoordinator,
         interactor:ReadySceneInteractor) {
        self.controllable = controllable
        self.interactor = interactor
    }
}

extension DefaultReadySceneController : ReadySceneController {
    func readyButtonPressed() {
        controllable.didPressReadyButton()
    }
    func viewDidLoad() {
        interactor.Initialize()
    }
}
