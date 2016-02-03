//
//  StatViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 11/1/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class StatViewController: UITableViewController {
    
    var player: Player?
    @IBOutlet var ftMissedLabel: UILabel!
    @IBOutlet var ftMadeLabel: UILabel!
    @IBOutlet var oRebLabel: UILabel!
    @IBOutlet var fgMissedLabel: UILabel!
    @IBOutlet var fgMadeLabel: UILabel!
    @IBOutlet var assistLabel: UILabel!
    @IBOutlet var turnoverLabel: UILabel!
    @IBOutlet var TptMissedLabel: UILabel!
    @IBOutlet var TptMadeLabel: UILabel!
    @IBOutlet var foulLabel: UILabel!
    @IBOutlet var dRebLabel: UILabel!
    @IBOutlet var blockLabel: UILabel!
    @IBOutlet var stealLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = player!.name
        ftMissedLabel.text = String(player!.ftmissed)
        ftMadeLabel.text = String(player!.ftmade)
        fgMissedLabel.text = String(player!.fgmissed)
        fgMadeLabel.text = String(player!.fgmade)
        oRebLabel.text = String(player!.oreb)
        assistLabel.text = String(player!.assist)
        turnoverLabel.text = String(player!.turnover)
        foulLabel.text = String(player!.foul)
        dRebLabel.text = String(player!.dreb)
        blockLabel.text = String(player!.block)
        stealLabel.text = String(player!.steal)
        TptMissedLabel.text = String(player!.Tmissed)
        TptMadeLabel.text = String(player!.Tmade)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ftMissed(sender: UIStepper) {
        var stat = Int(sender.value)
        ftMissedLabel.text = stat.description
        player?.ftmissed = stat
    }

    @IBAction func ftMade(sender: UIStepper) {
        var stat = Int(sender.value)
        ftMadeLabel.text = stat.description
        player?.ftmade = stat
    }
    
    @IBAction func oReb(sender: UIStepper) {
        var stat = Int(sender.value)
        oRebLabel.text = stat.description
        player?.oreb = stat
    }
    
    @IBAction func fgMissed(sender: UIStepper) {
        var stat = Int(sender.value)
        fgMissedLabel.text = stat.description
        player?.fgmissed = stat
    }
    
    @IBAction func fgMade(sender: UIStepper) {
        var stat = Int(sender.value)
        fgMadeLabel.text = stat.description
        player?.fgmade = stat
    }
    
    @IBAction func assist(sender: UIStepper) {
        var stat = Int(sender.value)
        assistLabel.text = stat.description
        player?.assist = stat
    }
    
    @IBAction func turnover(sender: UIStepper) {
        var stat = Int(sender.value)
        turnoverLabel.text = stat.description
        player?.turnover = stat
    }
    
    @IBAction func TMissed(sender: UIStepper) {
        var stat = Int(sender.value)
        TptMissedLabel.text = stat.description
        player?.Tmissed = stat
    }
    
    @IBAction func TMade(sender: UIStepper) {
        var stat = Int(sender.value)
        TptMadeLabel.text = stat.description
        player?.Tmade = stat
    }
    @IBAction func foul(sender: UIStepper) {
        var stat = Int(sender.value)
        foulLabel.text = stat.description
        player?.foul = stat
    }
    
    @IBAction func dReb(sender: UIStepper) {
        var stat = Int(sender.value)
        dRebLabel.text = stat.description
        player?.dreb = stat
    }
    
    @IBAction func block(sender: UIStepper) {
        var stat = Int(sender.value)
        blockLabel.text = stat.description
        player?.block = stat
    }
    
    @IBAction func steal(sender: UIStepper) {
        var stat = Int(sender.value)
        stealLabel.text = stat.description
        player?.steal = stat
    }
    
    
}
