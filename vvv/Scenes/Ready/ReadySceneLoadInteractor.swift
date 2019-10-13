//
//  ReadySceneLoadInteractor.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

class ReadySceneLoadInteractor {
    let presenter:ReadyScenePresenter
    init(presenter:ReadyScenePresenter) {
        self.presenter = presenter
    }
}

extension ReadySceneLoadInteractor : Interactor {
    func interact(with event: Event) {
        self.presenter.present()
    }
}
