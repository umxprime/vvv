//
//  ReadySceneDataStructures.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

enum ReadyScene {
    struct ViewModel {
        let title:String
        let start:String
    }
    enum Events {
        case OnLoad
    }
}
