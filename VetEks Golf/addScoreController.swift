//
//  addScoreController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/20.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit
import CoreData
import FirebaseStorage
import FirebaseDatabase

//var scorecard:ScoreCardMO!



class addScoreController: UITableViewController {
    var selectedImage: UIImage?
  //  var interval = Double()
   // var actDate = Date()
  
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitScoreImageView: UIImageView!
    @IBOutlet weak var parTextField: UITextField!
    @IBOutlet weak var strokeTextField: UITextField!
    @IBOutlet weak var grossTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        submitScoreImageView.addGestureRecognizer(tapGesture)
        submitScoreImageView.isUserInteractionEnabled = true
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        let actDate = dateFormatter.stringFromDate(datePicker.date)
        
    }
    
    @IBAction func dateValue(_ sender: Any) {
      // var actDate = UIDatePicker()
       //datePicker.maximumDate = NSDate() as Date
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        let actDate = dateFormatter.string(from: NSDate() as Date)
        
        
  //      actDate = dateFormatter.string(from: self.datePicker.date)
        //        _ = self.datePicker?.date.timeIntervalSince1970
//        
       // _ = dateFormatter.string(from: datePicker.date)
        //let _: String = dateFormatter.string(from: (sender as AnyObject).date)
        
    }


    func handleSelectPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    
   
    
    
    
    
    
    // func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //     if let selectedImage = info[UIImagePickerControllerOriginalImage] as?
    //         UIImage {
    //         submitScoreImageView.image = selectedImage
    //         submitScoreImageView.contentMode = .scaleAspectFill
    //         submitScoreImageView.clipsToBounds = true
    //     }
    //     dismiss(animated: true, completion: nil)
    //}
    
    // MARK: - Table view data source
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                let imagePicker = UIImagePickerController()
//                imagePicker.allowsEditing = false
//                imagePicker.sourceType = .photoLibrary
//                
//                imagePicker.delegate = self
//                
//                present(imagePicker, animated: true, completion: nil)
//            }
//        }
//    }
    
    //let user take picture
    //imagePicker.sourceType = .camera
    
    
    
    // MARK: - Image Picker Delegate
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        
//        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            submitScoreImageView.image = selectedImage
//            submitScoreImageView.contentMode = .scaleAspectFill
//            submitScoreImageView.clipsToBounds = true
//        }
//        
//        let leadingConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
//        leadingConstraint.isActive = true
//        
//        let trailingConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
//        trailingConstraint.isActive = true
//        
//        let topConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
//        topConstraint.isActive = true
//        
//        let bottomConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
//        bottomConstraint.isActive = true
//        
//        dismiss(animated: true, completion: nil)
//    }
    
    
    @IBAction func save(_ sender: Any) {
        ProgressHUD.show("Waiting...", interaction: false)
        if let scoreImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(scoreImg, 0.1) {
            let photoIdString = NSUUID().uuidString
            print(photoIdString)
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOF_REF).child("scorecards").child(photoIdString)
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                    return
                }
                let photoUrl = metadata?.downloadURL()?.absoluteString
                self.sendDataToDatabase(photoUrl: photoUrl!)
                
            })
        } else {
            ProgressHUD.showError("Profile Image can't be empty")
        }
    }
    
    
    
    
        
//        if nameTextField.text == "" ||  parTextField.text == "" || strokeTextField.text == "" || grossTextField.text == "" || scoreTextField.text == "" {
//            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
//            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertController.addAction(alertAction)
//            present(alertController, animated: true, completion: nil)
//            
//            return
//        }
//        
//        print("Name: \(nameTextField.text ?? "") ")
//        print("Par: \(parTextField.text ?? "")")
//        print("Stroke: \(strokeTextField.text ?? "")")
//        print("Gross: \(grossTextField.text ?? "")")
//        print("Score: \(scoreTextField.text ?? "")")
//        
//        
//        
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            scorecard = ScoreCardMO(context: appDelegate.persistentContainer.viewContext)
//            scorecard.courseName = nameTextField.text
//            scorecard.parRating = parTextField.text
//            scorecard.strokeRating = strokeTextField.text
//            scorecard.gross = grossTextField.text
//            scorecard.score = scoreTextField.text
//            
//            
//            if let ScoreCardImage = submitScoreImageView.image {
//                if let imageData = UIImagePNGRepresentation(ScoreCardImage) {
//                    scorecard.image = NSData(data: imageData)
//                }
//            }
//            print("Saving data to context ...")
//            appDelegate.saveContext()
//        }
//        
//        
//        
//        dismiss(animated: true, completion: nil)
//    }
    
    func sendDataToDatabase(photoUrl: String) {
        let ref = Database.database().reference()
        let scoreReference = ref.child("scorecards")
        let newScoreId = scoreReference.childByAutoId().key
        let newScoreReference = scoreReference.child(newScoreId)
        newScoreReference.setValue(["photoUrl": photoUrl, "name": nameTextField.text!, "par": parTextField.text!, "stroke": strokeTextField.text!, "date": datePicker.date.timeIntervalSince1970, "gross": grossTextField.text!, "score": scoreTextField.text!], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Success")
            self.nameTextField.text = ""
            self.parTextField.text = ""
            self.strokeTextField.text = ""
            self.grossTextField.text = ""
            self.scoreTextField.text = ""
            self.submitScoreImageView.image = UIImage(named: "placeholder-photo")
            self.selectedImage = nil
            self.tabBarController?.selectedIndex = 0        })
    }
    
}



extension addScoreController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            submitScoreImageView.image = image
            
            let leadingConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true
            
            let trailingConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
            trailingConstraint.isActive = true
            
            let topConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            
            let bottomConstraint = NSLayoutConstraint(item: submitScoreImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: submitScoreImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
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


