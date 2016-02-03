//
//  PerViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class PerViewController: UITableViewController {

    var starters: [Player] = startersData
    var bench: [Player] = benchData
    var players:[Player] = startersData+benchData
    var perStarters: [Player]? = []
    var perBench:[Player]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        players = startersData+benchData
        for index in 0..<players.count {
            players[index].calculatePer()
            println(players[index].per)
        }
        players.sort{$0.per > $1.per}
        for player in players {
            println(player.name)
        }
        for i in 0..<5 {
            perStarters!.append(players[i])
        }
        for j in 5..<players.count {
            perBench!.append(players[j])
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0){return 5}
        else{ return players.count-5}
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0) {return "Starters"}
        else {return "Bench"}
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("PerCell", forIndexPath: indexPath)
            
            if(indexPath.section==0)
            {
                let player = perStarters![indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            else {
                let player = perBench![indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            return cell as! UITableViewCell
    }
}
