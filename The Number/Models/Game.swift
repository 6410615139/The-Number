//
//  Game.swift
//  The Number
//
//  Created by Supakrit Nithikethkul on 19/1/2567 BE.
//

struct Game {
    var the_number = Int.random(in: 0...100)
    var count = 0
    
    mutating func check(guess: Int) -> Int {
        self.count+=1
        if (guess == the_number) { // win
            return 0
        } else if (guess < the_number) { // "The number is greater than your guess."
            return -1
        } else if (guess > the_number) { // "The number is less than your guess."
            return 1
        } else { // "Error, there is something wrong."
            return 2
        }
    }
    
    mutating func startNewGame(start: Int, stop: Int) {
        count = 0
        the_number = Int.random(in: start...stop)
    }
    
}
