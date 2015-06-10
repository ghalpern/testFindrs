//
//  TableViewController.swift
//  
//
//  Created by Eital Schattner-Elmaleh on 6/9/15.
//
//

import UIKit
import ParseUI
import Parse




class TableViewController: PFQueryTableViewController {
    
    
    override init(style: UITableViewStyle, className: String!){
        
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.parseClassName = "eitalTest"
        self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
        
        
    }
    
    
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "eitalTest")
        query.orderByAscending("nameEnglish")
        
        return query
        
        
        
    }
    
    //overrride func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {

    var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
    if cell == nil {
    cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    }
    
    // Extract values from the PFObject to display in the table cell
    if let nameEnglish = object?["nameEnglish"] as? String {
    cell?.textLabel?.text = nameEnglish
    }
    if let capital = object?["capital"] as? String {
    cell?.detailTextLabel?.text = capital
    }
    
    return cell
    }
    
    
   // overrride func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //self.parseClassName = "endPost"
    var detailScene = segue.destinationViewController as! ViewController
    
    // Pass the selected object to the destination view controller.
    if let indexPath = self.tableView.indexPathForSelectedRow() {
    let row = Int(indexPath.row)
        
    //self.parseClassName = "endPost"
    
    detailScene.currentObject = (objects?[row] as! PFObject)
        
        
        
    //var ID = detailScene.currentObject?.objectId
    
        
    
    
    }
    }
    
}



