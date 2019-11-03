//
//  GeneratorsFactory.swift
//  vvv
//
//  Created by Maxime CHAPELET on 03/11/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol GeneratorsFactory {
    func createNonRepeatingNumberGenerator() -> NonRepeatingNumberGenerator
}

class DefaultGeneratorsFactory {
    
}

extension DefaultGeneratorsFactory: GeneratorsFactory {
    func createNonRepeatingNumberGenerator() -> NonRepeatingNumberGenerator {
        return DefaultNonRepeatingNumberGenerator()
    }
}
