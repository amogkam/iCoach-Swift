//
//  GameViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class GameViewController: UITableViewController {

    var games: [Game] = gamesData
    let formatter = NSDateFormatter()
    var chosenCellIndex: Int = 0
    @IBOutlet var addGame: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateStyle = .ShortStyle
        formatter.timeStyle = .NoStyle
        
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
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Games"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath)
            let game = games[indexPath.row] as Game
            cell.textLabel?!.text = game.name
            cell.detailTextLabel?!.text = formatter.stringFromDate(game.date)
            return cell as! UITableViewCell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        chosenCellIndex = indexPath.row
//        self.performSegueWithIdentifier("gameDetail", sender: self)
//    }
    @IBAction func gameAdd(sender: UIBarButtonItem) {
        let number = gamesData.count+1
        games.append(Game(name: "Game "+String(number)))
        gamesData.append(Game(name: "Game "+String(number)))
        let indexPath = NSIndexPath(forRow: games.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }
    
    @IBAction func saveGame(segue:UIStoryboardSegue) {
        if let gameViewController = segue.sourceViewController as? GameDetailViewController {
            
            if let game = gameViewController.game {
                    for index in 0..<games.count {
                        if games[index].name == game.name {
                            games[index] = game
                            gamesData[index] = game
                        }
                    }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "gameDetail") {
            if let viewController = segue.destinationViewController as? GameDetailViewController {
                if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                    var game = games[indexPath.row]
                    viewController.game = game
                }
            }
        }
//        let secondViewController = segue.destinationViewController as! GameDetailViewController
//        secondViewController.game = games[chosenCellIndex]
    }
}
