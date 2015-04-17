//
//  ViewController.swift
//  TableViewCntr
//
//  Created by TT MAC MINI 04 on 11/04/15.
//  Copyright (c) 2015 TT MAC MINI 04. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

   // let transportItems = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 /*   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("count")
        println("count- \(transportItems.count)")
        return transportItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("table element")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("transportCell") as UITableViewCell
        
        cell.textLabel?.text = transportItems[indexPath.row]

        return cell
    }*/
}

