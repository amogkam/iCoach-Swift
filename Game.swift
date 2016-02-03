//
//  Game.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import Foundation

struct Game {
    var date: NSDate
    var name: String?
    var starters: [Player]
    var bench: [Player]
    
    init(name:String?) {
        self.date=NSDate()
        self.name=name
        self.starters = startersData
        self.bench = benchData
    }
}