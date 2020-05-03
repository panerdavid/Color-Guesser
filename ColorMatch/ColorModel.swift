//
//  Color.swift
//  ColorMatch
//
//  Created by David Paner on 5/2/20.
//  Copyright © 2020 David Paner. All rights reserved.
//

import Foundation

struct ColorObj {
      var r: Double
      var g: Double
      var b: Double
    
    
//computes closeness of two colors
    func computeCloseness(guess: ColorObj) -> String{
        let rDiff = self.r - guess.r
              let gDiff = guess.g - self.g
              let bDiff = guess.b - self.b
              let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
              return "\(Int((1.0 - diff) * 100.0 + 0.5))%"
    }

    
    }
func toHex(val: Double) -> Int {
    return Int(val * 255.0)
}

func randomColor() -> ColorObj {
    return ColorObj(r: Double.random(in: 0..<1), g: Double.random(in: 0..<1), b: Double.random(in: 0..<1))
}
