//
//  ActivityScenePresenter.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivityScenePresenter {
    func present(time: TimeInterval, step: ActivityScene.Step)
}

class DefaultActivityScenePresenter {
    let view: ActivitySceneView
    init(view: ActivitySceneView) {
        self.view = view
    }
}

extension DefaultActivityScenePresenter : ActivityScenePresenter {
    func present(time: TimeInterval, step: ActivityScene.Step) {
        let viewModel = ActivityScene.ViewModel(
            time: String(format: "%.02fs", arguments: [time]),
            step: ActivityScene.ViewModel.Step(
                problem: step.problem,
                result: step.result,
                paging: "\(step.index)/\(step.total)"),
            canStepBackward: step.index > 1,
            canStepForward: step.index < step.total)
        self.view.update(with: viewModel)
    }
}
