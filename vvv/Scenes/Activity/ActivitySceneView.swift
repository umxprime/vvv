//
//  ActivitySceneView.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import UIKit

protocol ActivitySceneView {
    func update(with viewModel:ActivityScene.ViewModel)
}

class DefaultActivitySceneView: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var previousStepButton: UIButton!
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var pagingLabel: UILabel!
    var controller: ActivitySceneController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func previous(_ sender: Any) {
        controller?.previous()
    }
    @IBAction func next(_ sender: Any) {
        controller?.next()
    }
}

extension DefaultActivitySceneView: ActivitySceneView {
    func update(with viewModel: ActivityScene.ViewModel) {
        timeLabel.text = viewModel.time
        previousStepButton.isEnabled = viewModel.canStepBackward
        nextStepButton.isEnabled = viewModel.canStepForward
        problemLabel.text = "\(viewModel.step.problem) = \(viewModel.step.result)"
        pagingLabel.text = viewModel.step.paging
    }
}

extension DefaultActivitySceneView: ActivitySceneConfigurable {
    func configure(controller: ActivitySceneController) {
        self.controller = controller
    }
}
