//
//  TableViewController.swift
//  Teste3
//
//  Created by Felipe Viberti on 2/24/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchResultsUpdating {
    let apple=["Denver Broncos","Detroit Tigers","Maracana","Fluminense","Miami Heat"]
    var arraybusca=[String]()
    var searchController=UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater=self
        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchController.searchBar
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (self.searchController.active)
        {
            return self.arraybusca.count
        }
        else
        {
            return self.apple.count
        }

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell?
        if(self.searchController.active)
        {
            cell!.textLabel?.text=self.arraybusca[indexPath.row]
        }
        else
        {
            cell!.textLabel?.text=self.apple[indexPath.row]
        }
        return cell!
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.arraybusca.removeAll(keepCapacity: false)
        let predicate=NSPredicate(format:"SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array=(self.apple as NSArray).filteredArrayUsingPredicate(predicate)
        self.arraybusca=array as! [String]
        self.tableView.reloadData()
        
    }


}
