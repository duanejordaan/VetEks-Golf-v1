//
//  addGolferController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/22.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit
import CoreData

var golfer:GolfersMO!

class addGolferController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var golferImage: UIImageView!
    @IBOutlet weak var golferNameLbl: UILabel!
    @IBOutlet weak var golferName: UITextField!
    @IBOutlet weak var golferSurnameLbl: UILabel!
    @IBOutlet weak var golferSurname: UITextField!
    
    @IBOutlet weak var golferHandicapLbl: UILabel!
    
    @IBOutlet weak var golferHandicap: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  //  override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
  //      return 0
   // }

   // override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     // #warning Incomplete implementation, return the number of rows
   //     return 0
   // }

    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                imagePicker.delegate = self
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    //let user take picture
    //imagePicker.sourceType = .camera
    
    
    
    // MARK: - Image Picker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            golferImage.image = selectedImage
            golferImage.contentMode = .scaleAspectFill
            golferImage.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: golferImage, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: golferImage.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: golferImage, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: golferImage.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: golferImage, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: golferImage.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: golferImage, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: golferImage.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
        @IBAction func save(_ sender: Any) {
        if golferName.text == "" ||  golferSurname.text == "" || golferHandicap.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        print("Name: \(golferName.text ?? "") ")
        print("Surname: \(golferSurname.text ?? "")")
        print("Handicap: \(golferHandicap.text ?? "")")
        
        
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            golfer = GolfersMO(context: appDelegate.persistentContainer.viewContext)
            golfer.name = golferName.text
            golfer.surname = golferSurname.text
            golfer.handicap = golferHandicap.text
            
            if let golferImage = golferImage.image {
                if let imageData = UIImagePNGRepresentation(golferImage) {
                    golfer.image = NSData(data: imageData)
                }
            }
            print("Saving data to context ...")
            appDelegate.saveContext()
        }
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
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


