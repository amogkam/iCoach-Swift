//
//  GameStatViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class GameStatViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var game: Game?
    var ftMissed: Int = 0
    var ftMade: Int = 0
    var oReb: Int = 0
    var fgMissed: Int = 0
    var fgMade: Int = 0
    var TMissed:Int = 0
    var Tmade:Int = 0
    var assist:Int = 0
    var turnovers:Int = 0
    var fouls: Int = 0
    var dReb:Int = 0
    var blocks: Int = 0
    var steals: Int = 0
    var stats:[String:Int]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setStats()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        stats = ["FT Missed":ftMissed, "FT Made":ftMade, "Off. Reb.":oReb, "FG Missed":fgMissed, "FG Made":fgMade, "3pt Missed":TMissed, "3pt Made":Tmade, "Assit":assist, "Turnovers":turnovers, "Fouls":fouls, "Def. Reb.":dReb, "Blocks":blocks, "Steals":steals]
        let keys:[String] = [String](stats!.keys)
        let values:[Int] = [Int](stats!.values)
        cell.textLabel?!.text = keys[indexPath.row]
        cell.detailTextLabel?!.text = String(values[indexPath.row])
        
        return cell as! UITableViewCell
    }
    
    func setStats() {
        for index in 0..<game!.starters.count {
            self.ftMissed+=self.game!.starters[index].ftmissed
            self.ftMade+=self.game!.starters[index].ftmade
            self.oReb+=self.game!.starters[index].oreb
            self.fgMissed+=self.game!.starters[index].fgmissed
            self.fgMade+=self.game!.starters[index].fgmade
            self.TMissed+=self.game!.starters[index].ftmade
            self.Tmade+=self.game!.starters[index].Tmissed
            self.ftMade+=self.game!.starters[index].Tmade
            self.assist+=self.game!.starters[index].assist
            self.turnovers+=self.game!.starters[index].turnover
            self.fouls+=self.game!.starters[index].foul
            self.dReb+=self.game!.starters[index].dreb
            self.blocks+=self.game!.starters[index].block
            self.steals+=self.game!.starters[index].steal
        }
        for index in 0..<game!.bench.count {
            self.ftMissed+=self.game!.bench[index].ftmissed
            self.ftMade+=self.game!.bench[index].ftmade
            self.oReb+=self.game!.bench[index].oreb
            self.fgMissed+=self.game!.bench[index].fgmissed
            self.fgMade+=self.game!.bench[index].fgmade
            self.TMissed+=self.game!.bench[index].ftmade
            self.Tmade+=self.game!.bench[index].Tmissed
            self.ftMade+=self.game!.bench[index].Tmade
            self.assist+=self.game!.bench[index].assist
            self.turnovers+=self.game!.bench[index].turnover
            self.fouls+=self.game!.bench[index].foul
            self.dReb+=self.game!.bench[index].dreb
            self.blocks+=self.game!.bench[index].block
            self.steals+=self.game!.bench[index].steal
        }
        
    }
        
    }
    

