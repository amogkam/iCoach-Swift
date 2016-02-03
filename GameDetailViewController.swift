//
//  GameDetailViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class GameDetailViewController: UITableViewController {

    var game:Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        if(section==0){ return game!.starters.count}
        else{ return game!.bench.count}
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0) {return "Starters"}
        else {return "Bench"}
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("GamePlayerCell", forIndexPath: indexPath)
            
            if(indexPath.section==0)
            {
                let player = game!.starters[indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            else {
                let player = game!.bench[indexPath.row] as Player
                cell.textLabel?!.text = player.name
                cell.detailTextLabel?!.text = String(player.number)
            }
            return cell as! UITableViewCell
    }
    
    @IBAction func saveStat(segue:UIStoryboardSegue) {
        if let statViewController = segue.sourceViewController as? StatViewController {
            
            if let player = statViewController.player {
                if player.starter! {
                    for index in 0..<game!.starters.count {
                        if game!.starters[index].number == player.number {
                            game!.starters[index] = player
                        }
                    }
                }
                else {
                    for index in 0..<game!.bench.count {
                        if game!.bench[index].number == player.number {
                            game!.bench[index] = player
                        }
                    }
                    
                }
                
            }
        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "statView") {
            if let viewController = segue.destinationViewController as? StatViewController {
                if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                    if indexPath.section==0 {
                        var player = game!.starters[indexPath.row]
                        viewController.player = player
                    }
                    else {
                        var player = game!.bench[indexPath.row]
                        viewController.player = player
                    }
                }
            }
        }
        else if(segue.identifier == "gameStatView") {
            if let viewController = segue.destinationViewController as? GameStatViewController {
                viewController.game = game
            }
        }
    }

}
