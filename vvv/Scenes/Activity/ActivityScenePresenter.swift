//
//  ActivityScenePresenter.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivityScenePresenter {
    func present(time:TimeInterval)
}

class DefaultActivityScenePresenter {
    let view: ActivitySceneView
    init(view: ActivitySceneView) {
        self.view = view
    }
}

extension DefaultActivityScenePresenter : ActivityScenePresenter {
    func present(time: TimeInterval) {
        let viewModel = ActivityScene.ViewModel(time: String(format: "%.02fs", arguments: [time]))
        self.view.update(with: viewModel)
    }
}
