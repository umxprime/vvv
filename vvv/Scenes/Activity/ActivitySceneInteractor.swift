//
//  ActivitySceneInteractor.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivitySceneInteractor {
    func Initialize()
    func Deinitialize()
}

class DefaultActivitySceneInteractor {
    var startDate:Date?
    var updateTimer:Timer?
    let presenter: ActivityScenePresenter
    init(presenter: ActivityScenePresenter) {
        self.presenter = presenter
    }
}

extension DefaultActivitySceneInteractor : ActivitySceneInteractor {
    func Initialize() {
        startDate = Date()
        updateTimer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true, block: { [weak self] (timer) in
            guard let self = self else {return}
            guard let startDate = self.startDate else {return}
            let time = -startDate.timeIntervalSinceNow
            self.presenter.present(time: time)
        })
        self.presenter.present(time: 0.0)
    }
    func Deinitialize() {
        updateTimer?.invalidate()
    }
}
