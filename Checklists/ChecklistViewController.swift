//
//  ViewController.swift
//  Checklists
//
//  Created by Edy Hernandez on 8/18/16.
//  Copyright © 2016 Edy Hernandez. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(tableView: UITableView,
            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // This gets a copy of the prototype cell from the storyboard, either a new one or a recycled one, and puts it into the local constant named cell. Remember: Cell in this case is a constant because it's defined with "let", not "var". It is also local because it is defined inside a method (in this case, the "tableview(...)" method
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
                                    "CheckListItem", forIndexPath: indexPath)
        // End comment
        
        
        
        // Here, I am asking the table view cell for the view with tag 1000. This is the tag I set earlier on the label in the storyboard, so this returns a reference to the corresponding UILabel object.
        
        let label = cell.viewWithTag(1000) as! UILabel // Using tags is a handy trick to get a reference to a UI element without having to make an @IBOutlet variable for it. 
        
        //End Comment
        
        
        
        if indexPath.row % 5 == 0 { // This sign, "%", is the remainder operator. It returns the remainder of a division, like in math! For example, 13 % 4 = 1, because four goes into thirteen 3 times with a remainder of 1.
            label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
        }
        
        return cell
    }
    
    override func tableView (table: UITableView,
                             didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .None {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

