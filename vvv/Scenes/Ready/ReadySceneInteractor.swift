//
//  ReadySceneInteractor.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ReadySceneInteractor {
    func Initialize()
}

class DefaultReadySceneInteractor {
    let presenter:ReadyScenePresenter
    init(presenter:ReadyScenePresenter) {
        self.presenter = presenter
    }
}

extension DefaultReadySceneInteractor : ReadySceneInteractor {
    func Initialize() {
        self.presenter.present()
    }
}
