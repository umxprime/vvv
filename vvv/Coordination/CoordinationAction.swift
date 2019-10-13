//
//  CoordinationAction.swift
//  vvv
//
//  Created by Maxime CHAPELET on 27/09/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

extension Coordination {
    enum Action {
        enum Destination {
            case BeginActivity
            case EndActivity
        }
        case Launch
        case Navigate(to:Destination)
    }
}
