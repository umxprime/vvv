//
//  ReadyView.swift
//  vvv
//
//  Created by Maxime CHAPELET on 05/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import UIKit

protocol ReadySceneView {
    func update(with viewModel:ReadyScene.ViewModel)
}

class DefaultReadySceneView: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var controller: ReadySceneController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller?.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func start(_ sender: Any) {
        self.controller?.readyButtonPressed()
    }
    
}

extension DefaultReadySceneView : ReadySceneView {
    func update(with viewModel: ReadyScene.ViewModel) {
        titleLabel.text = viewModel.title
        startButton.setTitle(viewModel.start, for: .normal)
    }
}

extension DefaultReadySceneView : ReadySceneConfigurable {
    func configure(controller: ReadySceneController) {
        self.controller = controller
    }
}
