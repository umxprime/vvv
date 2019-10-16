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
    var controller: ActivitySceneController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
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

}

extension DefaultActivitySceneView: ActivitySceneView {
    func update(with viewModel: ActivityScene.ViewModel) {
        timeLabel.text = viewModel.time
    }
}

extension DefaultActivitySceneView: ActivitySceneConfigurable {
    func configure(controller: ActivitySceneController) {
        self.controller = controller
    }
}
