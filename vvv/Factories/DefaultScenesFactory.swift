//
//  DefaultScenesFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

class DefaultScenesFactory {
    
}

extension DefaultScenesFactory : ScenesFactory {
    func activity() -> UIViewController {
        let viewController = ActivityView(nibName: nil, bundle: nil)
        return viewController
    }
}
