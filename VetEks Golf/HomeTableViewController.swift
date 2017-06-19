//
//  HomeTableViewController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/19.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override var prefersStatusBarHidden: Bool {
        return true
        
    }
    
    
    var Date = ["09/04/17","19/04/17", "21/04/17", "03/05/17", "04/05/17", "18/05/17", "19/05/17", "20/05/17", "21/05/17", "22/05/17",]
    
    var golfCourseNames = ["Wingate Park Country Club", "Woodhill Country Club", "Silver Lakes Country Club", "Pretoria Country Club", "Service Golf Club", "Waterkloof Country Club", "Pretoria Golf Club", "Irene Country Club", "Centurion Country Club", "Zwartkop Country Club"]
    
    var golfCourseImages = ["wingate.png", "woodhill.png", "silverlakes.png", "pcc.png", "download.png", "waterkloof.png", "download.png", "irene.png", "centurion.png", "download.png"]
    
    var golfScore = ["36", "30", "29", "36", "30", "29", "36", "30", "29", "35" ]
    
    
    
    
    
    
    
    
    
    

    // MARK: - Table view data source
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        
        
        //configue cell...
        cell.dateLabel.text = Date[indexPath.row]
        cell.courseLabel.text = golfCourseNames[indexPath.row]
        cell.scoreLabel.text = golfScore[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: golfCourseImages[indexPath.row])
        
        return cell
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return golfCourseNames.count
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        //add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //display the menu
        present(optionMenu, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //delete the row form the data source
            golfCourseNames.remove(at: indexPath.row)
            Date.remove(at: indexPath.row)
            golfScore.remove(at: indexPath.row)
            golfCourseImages.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
                let defaultText = "New score posted at " +
                    self.golfCourseNames[indexPath.row]
            if let imageToShare = UIImage(named: self.golfCourseNames[indexPath.row]) {
                            let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
                // Delete the row from the data source
                self.golfCourseNames.remove(at: indexPath.row)
                self.Date.remove(at: indexPath.row)
                self.golfScore.remove(at: indexPath.row)
                self.golfCourseImages.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        return [deleteAction, shareAction]
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
