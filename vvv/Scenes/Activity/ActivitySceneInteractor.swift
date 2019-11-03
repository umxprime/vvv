//
//  ActivitySceneInteractor.swift
//  vvv
//
//  Created by Maxime CHAPELET on 16/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol ActivitySceneInteractor {
    func initialize()
    func nextStep()
    func previousStep()
    func deinitialize()
}

class DefaultActivitySceneInteractor {
    var startDate:Date?
    var updateTimer:Timer?
    var step = 0
    let activity: ActivityEntity
    let presenter: ActivityScenePresenter
    init(presenter: ActivityScenePresenter,
         activitiesFactory: ActivitiesFactory,
         generatorsFactory: GeneratorsFactory) {
        self.presenter = presenter
        let numberGenerator = generatorsFactory.createNonRepeatingNumberGenerator()
        numberGenerator.configure(min: 0, max: 10)
        self.activity = activitiesFactory.create(count: 20, setup: { () -> ExpressionSetup in
            
            return ExpressionSetup(format: "7 + %i", arguments: [numberGenerator.next()])
        })
    }
    func sceneStep() -> ActivityScene.Step {
        let step = self.activity.steps[self.step]
        return ActivityScene.Step(
            problem: step.expression.description,
            result: String(step.expression.evaluate()),
            index: self.step + 1,
            total: self.activity.steps.count)
    }
}

extension DefaultActivitySceneInteractor : ActivitySceneInteractor {
    func nextStep() {
        self.step += self.step + 1 < self.activity.steps.count ? 1 : 0
        startDate = Date()
        self.presenter.present(time: 0.0, step: self.sceneStep())
    }
    
    func previousStep() {
        self.step -= self.step - 1 >= 0 ? 1 : 0
        startDate = Date()
        self.presenter.present(time: 0.0, step: self.sceneStep())
    }
    
    func initialize() {
        startDate = Date()
        updateTimer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true, block: { [weak self] (timer) in
            guard let self = self else {return}
            guard let startDate = self.startDate else {return}
            let time = -startDate.timeIntervalSinceNow
            self.presenter.present(
                time: time,
                step: self.sceneStep())
        })
        self.presenter.present(time: 0.0, step: self.sceneStep())
    }
    func deinitialize() {
        updateTimer?.invalidate()
    }
}
