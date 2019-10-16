//
//  ReadySceneLoadInteractor.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ReadySceneLoadInteractor {
    func Initialize()
}

class DefaultReadySceneLoadInteractor {
    let presenter:ReadyScenePresenter
    init(presenter:ReadyScenePresenter) {
        self.presenter = presenter
    }
}

extension DefaultReadySceneLoadInteractor : ReadySceneLoadInteractor {
    func Initialize() {
        self.presenter.present()
    }
}
