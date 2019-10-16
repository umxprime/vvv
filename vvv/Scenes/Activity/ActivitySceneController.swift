//
//  ActivitySceneController.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivitySceneController {
    func viewDidLoad()
    func viewDidDisappear()
}

class DefaultActivitySceneController {
    let interactor: ActivitySceneInteractor
    init(interactor: ActivitySceneInteractor) {
        self.interactor = interactor
    }
}

extension DefaultActivitySceneController : ActivitySceneController {
    func viewDidLoad() {
        interactor.Initialize()
    }
    
    func viewDidDisappear() {
        interactor.Deinitialize()
    }
}
