//
//  Coordinating.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol Coordinating {
    func enter()
    func coordinate(with action:Coordination.Action)
    func exit()
}
