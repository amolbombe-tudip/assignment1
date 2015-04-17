//
//  TableViewController.swift
//  TableViewCntr
//
//  Created by TT MAC MINI 04 on 11/04/15.
//  Copyright (c) 2015 TT MAC MINI 04. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBAction func next(sender: AnyObject) {
        
        for name in checkedItems {
        println("name of selected continent =\(name)")
        }
        
        
        
        if (checkedItems.count < 1) || (checkedItems.count > 3)
        {
            let alertController = UIAlertController(title: "Warning", message:
                "select at least one and maximum Three", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else
        {
          
            self.performSegueWithIdentifier("showdetail", sender: tableView)
        }
        
    }
    let transportItems = ["Asia","Africa","North America","South America","Antarctica","Australia","Europe"]
    
    var detail="asia"
    
    var checkedItems:[String]=[]
    
    override func viewDidAppear(animated: Bool) {
super.viewDidAppear(animated)
        println("will didappear")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        println("will appear")
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return transportItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("cellForRowAtIndexPath")
        
        var item = self.transportItems[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("transportCell", forIndexPath: indexPath) as UITableViewCell
        
        println("TEST: \(transportItems[indexPath.row])")
        
        cell.textLabel?.text = transportItems[indexPath.row]
        
        
        if contains(self.checkedItems, item) {
            
            cell.accessoryType = .Checkmark
            
        }
        else {
            
            cell.accessoryType = .None
        }

        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        detail=transportItems[indexPath.row]
        
        
        
        
        
    
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = self.transportItems[indexPath.row]
        
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        
        let index = find(self.checkedItems, item)
        
        if let index = index{
            
            self.checkedItems.removeAtIndex(index)
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
        else
        {
            self.checkedItems.append(item)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        
      
        
        
        
     
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showdetail" {
            let DetailController = segue.destinationViewController as DetailViewController
            
            DetailController.display += checkedItems
        }
        
       
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
