//
//  DetailViewController.swift
//  TableViewCntr
//
//  Created by TT MAC MINI 04 on 14/04/15.
//  Copyright (c) 2015 TT MAC MINI 04. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var countriesTV: UITableView!
   
    
    let tableData = ["Asia","Africa","North America","South America","Antarctica","Australia","india","pakistan","japan","china","afganistan","bhutan","South Africa","zimbabwe","keniya","usa","wi","canada","chili","brazil","east","west","australia","new zeland","france","itali","uk"]
    
    var checkedItems:[String]=[]
    
    var asia=["india","pakistan","japan","china","afganistan","bhutan"]
    
    var africa=["South Africa","zimbabwe","keniya"]
    
    var north=["usa","wi","canada"]
    
    var southa=["chili","brazil"]
    
    var antarctica=["east","west"]
    
    var australia=["australia","new zeland"]
    
    var europe=["france","itali","uk"]
   
 //   var tableData = ["Asia","Africa","North America","South America","Antarctica","Australia"]
    
    var continent="Asia"
    
    var display = [String]()
    
    var dis = [String]()
    
    var filteredTableData = [String]()
    
    var searchActive : Bool = false
    
    var filtered:[String] = []
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)


    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
       // tableData += asia
       
      //  += africa += north += southa += antarctica += australia += europe
        
        
        println(display)
        
        for index in display {
            if index=="Asia"
            {
                dis += asia
            }
            
            if index=="Africa"
            {
                dis += africa
            }
            if index=="North America"
            {
                dis += north
            }
            if index=="South America"
            {
                dis += southa
            }
            if index=="Antarctica"
            {
                dis += antarctica
            }
            if index=="Australia"
            {
                dis += australia
            }
            if index=="Europe"
            {
                dis += europe
            }
            
        }
        countriesTV.delegate = self
        countriesTV.dataSource = self
        searchBar.delegate=self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = true;
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = tableData.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.countriesTV.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        
        if(searchActive) {
            return filtered.count
        }
        
        
        println("count of dis=\(dis)")
        return dis.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
       
        
        
        if(searchActive){
            
            if filtered[indexPath.row] == "Asia" || filtered[indexPath.row] == "Africa" || filtered[indexPath.row] == "North America" || filtered[indexPath.row] == "South America" || filtered[indexPath.row] == "Antarctica" || filtered[indexPath.row] == "Australia" || filtered[indexPath.row] == "Europe"
            {
            cell.textLabel?.text = filtered[indexPath.row]
            }
            else
            {
                for index in asia
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-Asia"
                    }
                }
                
                for index in africa
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-Africa"
                    }
                }
                
                for index in north
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-North America"
                    }
                }
                
                for index in southa
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-South America"
                    }
                }
                
                for index in antarctica
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-Antarctica"
                    }
                }
                
                for index in australia
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-Australia"
                    }
                }
                
                for index in europe
                {
                    if filtered[indexPath.row] == index
                    {
                        filtered[indexPath.row] += " "
                        filtered[indexPath.row] += "-Europe"
                    }
                }
            }
            
             cell.textLabel?.text = filtered[indexPath.row]
            
        } else {
            
            cell.textLabel?.text = dis[indexPath.row]
        }

        
        
        
        
       
        
     /*   if continent=="Asia"
        {
            var item = self.asia[indexPath.row]
            
           
           
            if contains(self.checkedItems, item) {
            
                cell.accessoryType = .Checkmark
            
            }
            else {
                
                cell.accessoryType = .None
            }

        }
        else if continent=="Africa"
        {
            cell.textLabel?.text = africa[indexPath.row]

        }
        else if continent=="North America"
        {
            cell.textLabel?.text = north[indexPath.row]

        }
        else if continent=="South America"
        {
            cell.textLabel?.text = southa[indexPath.row]

        }
        else if continent=="Antarctica"
        {
            cell.textLabel?.text = antarctica[indexPath.row]
        }
        else if continent=="Australia"
        {
            cell.textLabel?.text = australia[indexPath.row]

        }
        else if continent=="Europe"
        {
            cell.textLabel?.text = europe[indexPath.row]

        }else
        {
            
            cell.textLabel?.text = asia[indexPath.row]

        }  */
        

        
        
        
        return cell
        
        
        
        
        //return UITableViewCell()
    }
    
    
    
    
    
    
    
   func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        
        UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            
        
            
            
            
            
            if continent=="Asia"
            {
                asia.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

                
            }
            else if continent=="Africa"
            {
                africa.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                
            }
            else if continent=="North America"
            {
                north.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

                
            }
            else if continent=="South America"
            {
                southa.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

                
            }
            else if continent=="Antarctica"
            {
                antarctica.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

            }
            else if continent=="Australia"
            {
                australia.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
            else if continent=="Europe"
            {
                europe.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

                
            }else
            {
                
                asia.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                
            }
            
            
            
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.Delete
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   
    // for selection
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = self.asia[indexPath.row]
        
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
    //  end of selection
    }
    
}
