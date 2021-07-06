//
//  Game.swift
//  Bullseye
//
//  Created by soohong ahn on 2021/07/02.
//

import Foundation

struct Game{
    var target = Int.random(in: 1..<100)
    var score = 0
    var round = 1
    
    func calcPoint(sliderValue: Int) -> Int{
        100 - abs(self.target - sliderValue)
    }
    
    mutating func update(currentScore: Int, currentRound: Int){
        self.score += currentScore
        self.round = currentRound + 1
        self.target = Int.random(in: 1..<100)
    }
    
    mutating func reset(){
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1..<100)
    }
}
