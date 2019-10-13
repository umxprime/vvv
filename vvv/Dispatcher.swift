//
//  Dispatcher.swift
//  vvv
//
//  Created by Maxime CHAPELET on 13/10/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

class Event : Hashable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    private let uuid = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

protocol Interactor {
    func interact(with event:Event)
}

protocol Dispatcher {
    func bind(event:Event, interactor:Interactor)
    func dispatch(event:Event)
}

class DefaultDispatcher {
    var bindings = [Event:Interactor]()
}

extension DefaultDispatcher : Dispatcher {
    func bind(event: Event, interactor: Interactor) {
        bindings[event] = interactor
    }
    func dispatch(event: Event) {
        guard let interactor = bindings[event] else {
            return
        }
        interactor.interact(with: event)
    }
}
