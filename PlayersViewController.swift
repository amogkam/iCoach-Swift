//
//  PlayersViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 10/31/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var starters: [Player] = startersData
    var bench: [Player] = benchData

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        for game in gamesData {
            for starter in game.starters {
                for index in 0..<startersData.count {
                    if startersData[index].number == starter.number {
                        startersData[index].ftmissed+=starter.ftmissed
                        startersData[index].ftmade+=starter.ftmade
                        startersData[index].oreb+=starter.oreb
                        startersData[index].fgmissed+=starter.fgmissed
                        startersData[index].fgmade+=starter.fgmade
                        startersData[index].Tmade+=starter.Tmade
                        startersData[index].Tmissed+=starter.Tmissed
                        startersData[index].assist+=starter.assist
                        startersData[index].turnover+=starter.turnover
                        startersData[index].dreb+=starter.dreb
                        startersData[index].block+=starter.block
                        startersData[index].foul+=starter.foul
                        startersData[index].steal+=starter.steal
                        
                    }
                }
            }
            for bench in game.bench {
                for index in 0..<benchData.count {
                    if benchData[index].number == bench.number {
                        benchData[index].ftmissed+=bench.ftmissed
                        benchData[index].ftmade+=bench.ftmade
                        benchData[index].oreb+=bench.oreb
                        benchData[index].fgmissed+=bench.fgmissed
                        benchData[index].fgmade+=bench.fgmade
                        benchData[index].Tmade+=bench.Tmade
                        benchData[index].Tmissed+=bench.Tmissed
                        benchData[index].assist+=bench.assist
                        benchData[index].turnover+=bench.turnover
                        benchData[index].dreb+=bench.dreb
                        benchData[index].block+=bench.block
                        benchData[index].foul+=bench.foul
                        benchData[index].steal+=bench.steal
                        
                    }
                }
            }
        }
        starters = startersData
        bench = benchData
        for starter in starters {
            println(starter.ftmissed)
            println(starter.ftmade)
            println(starter.oreb)
            println(starter.fgmissed)
            println(starter.fgmade)
            println(starter.Tmissed)
            println(starter.Tmade)
            println(starter.assist)
            println(starter.turnover)
            println(starter.steal)
            println(starter.block)
            println(starter.foul)
            println(starter.dreb)
        }
        for benchP in bench {
            println(benchP.ftmissed)
            println(benchP.ftmade)
            println(benchP.oreb)
            println(benchP.fgmissed)
            println(benchP.fgmade)
            println(benchP.Tmissed)
            println(benchP.Tmade)
            println(benchP.assist)
            println(benchP.turnover)
            println(benchP.steal)
            println(benchP.block)
            println(benchP.foul)
            println(benchP.dreb)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0){ return starters.count}
        else{ return bench.count}
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0) {return "Starters"}
        else {return "Bench"}
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
            
            if(indexPath.section==0)
            {
                let player = starters[indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            else {
                let player = bench[indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            return cell as! UITableViewCell
    }
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        
        if let playersDetailViewController = segue.sourceViewController as? PlayersDetailViewController {
            
            //add the new player to the players array
            if let player = playersDetailViewController.player {
                if(player.starter!) {
                    starters.append(player)
                    startersData.append(player)
                    let indexPath = NSIndexPath(forRow: starters.count-1, inSection: 0)
                    tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                    
                }
                else {
                    bench.append(player)
                    benchData.append(player)
                    let indexPath = NSIndexPath(forRow: bench.count-1, inSection: 1)
                    tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                }
                
            }
        }
    }

}
