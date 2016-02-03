//
//  PlayersDetailViewController.swift
//  iCoach-Swift
//
//  Created by Amog Kamsetty on 10/31/15.
//  Copyright (c) 2015 Amog Kamsetty. All rights reserved.
//

import UIKit

class PlayersDetailViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var player:Player?
    var number:Int = 0
    var starter:Bool? = false

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var starterSwitch: UISwitch!
    
    var numberPickerView: UIPickerView = UIPickerView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.inputView = numberPickerView
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
        numberPickerView.showsSelectionIndicator = true
        numberPickerView.backgroundColor = UIColor.clearColor()
        //starterSwitch.addTarget(self, action: Selector(switchIsChanged:), forControlEvents: UIControlEvents.ValueChanged)
        if(startersData.count>=5) {
            starterSwitch.enabled=false
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, starter: starter, number: number)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(row)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = String(row)
        number = row
    }
    
    @IBAction func switchIsChanged(sender: UISwitch) {
        if(sender.on)
        {
            starter=true
        }
        else
        {
            starter=false
        }
    }
}
