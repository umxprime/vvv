//
//  ScenesFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation
import UIKit

protocol ScenesFactory {
    func activity() -> UIViewController
    func ready(controllable:ReadySceneControllableCoordinator) -> UIViewController
}
