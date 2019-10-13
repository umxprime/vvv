//
//  ReadyScenePresenter.swift
//  vvv
//
//  Created by Maxime CHAPELET on 05/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ReadyScenePresenter {
    func present()
}

class DefaultReadyScenePresenter {
    let view:ReadySceneView
    init(view:ReadySceneView) {
        self.view = view
    }
}

extension DefaultReadyScenePresenter : ReadyScenePresenter {
    func present() {
        let viewModel = ReadyScene.ViewModel(title: "Ready ?", start: "Go !")
        self.view.update(with: viewModel)
    }
}
