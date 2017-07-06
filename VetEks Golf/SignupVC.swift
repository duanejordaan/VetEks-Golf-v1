//
//  SignUpVC.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/27.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase





class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpVC.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        
        
        //    handleTextField()
    }
    
    // func handleTextField() {
    //     nameTextField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
    //     emailTextField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
    //     passwordTextField.addTarget(self, action: #selector(SignUpVC.textFieldDidChange), for: UIControlEvents.editingChanged)
    
    // }
    
    //  func textFieldDidChange() {
    //      guard let username = nameTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty,
    //          let password = passwordTextField.text, !password.isEmpty else {
    //              signUpButton.setTitleColor(UIColor.lightText, for: UIControlState.normal)
    //             signUpButton.isEnabled = false
    //             return
    //     }
    
    //     signUpButton.setTitleColor(UIColor.darkText, for: UIControlState.normal)
    //     signUpButton.isEnabled = true
    // }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func signUpButton(_ sender: Any) {
        if nameTextField.text == "" ||  emailTextField.text == "" || passwordTextField.text == ""  {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        print("Name: \(nameTextField.text ?? "") ")
        print("Email: \(emailTextField.text ?? "")")
        print("Password: \(passwordTextField.text ?? "")")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(pickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1) {
            AuthService.signUp(username: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, imageData: imageData, onSuccess: {
                self.performSegue(withIdentifier: "toTabBar", sender: nil)
            }, onError: { (errorString) in
                print(errorString!)
            })
        } else {
            ProgressHUD.showError("Profile Image can't be empty")
            //print("Profile Image can't be empty")
        }
    }
}

        
        
//        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user: User?, error: Error?) in
//            //error checking
//            if self.nameTextField.text == "" ||  self.emailTextField.text == "" || self.passwordTextField.text == ""  {
//                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
//                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alertController.addAction(alertAction)
//                self.present(alertController, animated: true, completion: nil)
//                
//                return
//            }
//            
//            let uid = user?.uid
//            let storageRef = Storage.storage().reference(forURL: "gs://eksvet-869e8.appspot.com").child("profile_image").child(uid!)
//            if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1) {
//                storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
//                    if error != nil {
//                        return
//                    }
//                    let profileImageUrl = metadata?.downloadURL()?.absoluteString
//                    
//                    self.setUserInfomation(profileImageUrl: profileImageUrl!, username: self.nameTextField.text!, email: self.emailTextField.text!, uid: uid!)
//                })
//            } else {
//                ProgressHUD.showError("Profile Image can't be empty")
//               // print("Profile Image can't be empty")
//            }             })
//        
//    }
    
//    func setUserInfomation(profileImageUrl: String, username: String, email: String, uid: String) {
//        let ref = Database.database().reference()
//        let usersReference = ref.child("users")
//        let newUserReference = usersReference.child(uid)
//        newUserReference.setValue(["username": username, "email": email, "profileImageUrl": profileImageUrl])
//        self.performSegue(withIdentifier: "toTabBar", sender: nil)
//    }


extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}


