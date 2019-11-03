//
//  NonRepeatingNumberGenerator.swift
//  vvv
//
//  Created by Maxime CHAPELET on 01/11/2019.
//  Copyright © 2019 Maxime CHAPELET. All rights reserved.
//

import Foundation

protocol NonRepeatingNumberGenerator {
    func configure(min:Int, max:Int)
    func next()->Int
}

class DefaultNonRepeatingNumberGenerator {
    var numberList = [Int]()
    var maxSwapIndex:UInt32 = 0
}

extension DefaultNonRepeatingNumberGenerator: NonRepeatingNumberGenerator {
    func configure(min: Int, max: Int) {
        numberList.removeAll()
        for value in min...max {
            numberList.append(value)
        }
        maxSwapIndex = UInt32(Swift.max(numberList.count - 1, 0))
    }
    
    func next() -> Int {
        if numberList.count == 0 {
            return 0
        }
        if maxSwapIndex == 0 {
            maxSwapIndex = UInt32(numberList.count - 1)
            return numberList[0]
        }
        var swapIndex: UInt32 = 0
        var value = 0
        if maxSwapIndex == UInt32(numberList.count - 1) {
            swapIndex = max(1, arc4random() % maxSwapIndex)
        } else {
            swapIndex = arc4random() % maxSwapIndex
        }
        value = numberList[Int(swapIndex)]
        numberList[Int(swapIndex)] = numberList[Int(maxSwapIndex)]
        numberList[Int(maxSwapIndex)] = value
        maxSwapIndex -= 1
        return value
    }
}
