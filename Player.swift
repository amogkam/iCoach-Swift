//
//  Player.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 10/31/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

public struct Player {
    var name: String?
    var starter: Bool?
    var number: Int
    var ftmissed: Int = 0
    var ftmade: Int = 0
    var oreb: Int = 0
    var fgmissed: Int = 0
    var fgmade: Int = 0
    var assist: Int = 0
    var turnover: Int = 0
    var foul: Int = 0
    var dreb: Int = 0
    var block: Int = 0
    var steal: Int = 0
    var Tmissed: Int = 0
    var Tmade: Int = 0
    var per:Double = 0
    
    init(name: String?, starter: Bool?, number: Int) {
        self.name = name
        self.starter = starter
        self.number = number
    }
    
    mutating func calculatePer() {
        self.per = (Double(fgmade)*85.910)+(Double(steal)*53.897)+(Double(Tmade)*51.757)+(Double(ftmade)*46.845)+(Double(block)*31.190)+(Double(oreb)*39.190)+(Double(assist)*34.677)+(Double(dreb)*14.707)-(Double(foul)*17.174)-(Double(ftmissed)*20.091)-(Double(fgmissed)*39.190)-(Double(turnover)*53.897)
    }
}
