//
//  HomeTableViewController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/19.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit
import CoreData


class HomeTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
    var scorecards:[ScoreCardMO] = []
    var golfers:[GolfersMO] = []
    var fetchResultController: NSFetchedResultsController<ScoreCardMO>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = false
        
        // Fetch data from data store
        let fetchRequest: NSFetchRequest<ScoreCardMO> = ScoreCardMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "score", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    scorecards = fetchedObjects
                }
            } catch {
                print(error)
            }
        }}
    
    
        


        
    

    //override var prefersStatusBarHidden: Bool {
    //    return true
        
   // }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    
    @IBAction func unwindToHomeScreen(seque:UIStoryboardSegue) {
        
    }
    
    //var Date = ["09/04/17","19/04/17", "21/04/17", "03/05/17", "04/05/17", "18/05/17", "19/05/17", "20/05/17", "21/05/17", "22/05/17",]
    
    //var golfCourseNames = ["Wingate Golf Club", "Woodhill Country Club", "Silver Lakes Country Club", "Pretoria Country Club", "Service Golf Club", "Waterkloof Country Club", "Pretoria Golf Club", "Irene Country Club", "Centurion Country Club", "Zwartkop Country Club"]
    
    //var golfCourseImages = ["wingate.png", "woodhill.png", "silverlakes.png", "pcc.png", "download.png", "waterkloof.png", "download.png", "irene.png", "centurion.png", "download.png"]
    
    //var golfScore = ["36", "30", "29", "36", "30", "29", "36", "30", "29", "35" ]
   
    
    
    //var scorecards:[Scorecard] = [
    //    Scorecard(name: "Wingate Golf Club", date: "09/04/17", score: "36", image: "wingate.png"),
    //    Scorecard(name: "Woodhill Country Club", date: "19/04/17", score: "39", image: "woodhill.png"),
        
    //    Scorecard(name: "Silver Lakes Country Club", date: "03/05/17", score: "30", image: "silverlakes.png"),
        
    //    Scorecard(name: "Pretoria Country Club", date: "06/05/17", score: "31", image: "pcc.png"),
        
    //    Scorecard(name: "Service Golf Club", date: "09/05/17", score: "30", image: "download.png"),
        
    //    Scorecard(name: "Waterkloof Country Club", date: "19/05/17", score: "34", image: "waterkloof.png"),
        
    //    Scorecard(name: "Pretoria Golf Club", date: "20/05/17", score: "29", image: "download.png"),
        
    //    Scorecard(name: "Irene Country Club", date: "21/05/17", score: "36", image: "irene.png"),
        
    //    Scorecard(name: "Centurion Country Club", date: "01/06/17", score: "34", image: "centurion.png"),
        
    //    Scorecard(name: "Zwartkop Country Club", date: "09/06/17", score: "32", image: "download.png"),
        
    //    ]
    
    
    
    
    
    
    
    

    // MARK: - Table view data source
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        
        
        //configue cell...
        cell.dateLabel.text = scorecards[indexPath.row].date
        cell.courseLabel.text = scorecards[indexPath.row].courseName
        cell.scoreLabel.text = scorecards[indexPath.row].score
        cell.thumbnailImageView.image = UIImage(data: scorecards[indexPath.row].image! as Data)
        
        return cell
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scorecards.count
        
    }

   // override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //create an option menu as an action sheet
   //     let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        //add actions to the menu
    //    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //    optionMenu.addAction(cancelAction)
        
        //display the menu
     //   present(optionMenu, animated: true, completion: nil)
//}
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //delete the row form the data source
            scorecards.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Added a new score at " + self.scorecards[indexPath.row].courseName!
            
            if let scorecardImage = self.scorecards[indexPath.row].image,
                let imageToShare = UIImage(data: scorecardImage as Data) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                let scorecardToDelete = self.fetchResultController.object(at: indexPath)
                context.delete(scorecardToDelete)
                
                appDelegate.saveContext()
            }
            
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "showScoreCard" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = seque.destination as!
                ScoreCardViewController
                destinationController.scorecard = scorecards[indexPath.row]
            }
        }    }
    
    
    
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
    
    // MARK: NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            scorecards = fetchedObjects as! [ScoreCardMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    

}
