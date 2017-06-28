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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                let ref = Database.database().reference()
                let usersReference = ref.child("users")
                //   print(usersReference.description()) : https://instagramclone-fc544.firebaseio.com/users
                let uid = user?.uid
                let newUserReference = usersReference.child(uid!)
                newUserReference.setValue(["username": self.nameTextField.text!, "email": self.emailTextField.text!])
                print("description: \(newUserReference.description())")
            }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
