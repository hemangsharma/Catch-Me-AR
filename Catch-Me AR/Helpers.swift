//
//  Helpers.swift
//  Catch-Me AR
//
//  Created by Hemang on 31/05/20.
//  Copyright © 2020 Hemang. All rights reserved.
//

import Foundation

enum GameState:Int {
    case none, spwanBirds
}

func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}

func randomNumber (lowerBound lower:Int, upperBound upper:Int) -> Int {
    return Int(arc4random()) / Int(UInt32.max) * (lower - upper) + upper
}
