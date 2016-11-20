//
//  ViewController.swift
//  ReOrderingTableViewCell
//
//  Created by Pavan Kumar C on 20/10/16.
//  Copyright © 2016 Pavan Kumar CSedin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var dataArray: NSMutableArray? = []
  
  @IBOutlet weak var tblView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataArray?.addObjectsFromArray(["iOS","Android","Ruby","Python","Php","Elixer","Java"])
    tblView.setEditing(true, animated: true)
    tblView.tableFooterView = UIView()
  }
  
  //MARK:- Tableview delegate and datasource methods
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = dataArray?.count  {
      return count
    }
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tblView.dequeueReusableCellWithIdentifier("cell")
    
    if cell == nil {
      cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
    }
    
    cell?.textLabel?.text = dataArray![indexPath.row] as? String
    
    return cell!
  }
  
  func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    return .None
  }
  
  func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
  }
  
  func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    dataArray?.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
    tableView.reloadData()
  }
  
}

