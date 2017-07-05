//
//  AuthService.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/07/05.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class AuthService {
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        })
        
    
//    Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
//    //error checking
//    if self.emailTextField.text == "" || self.passwordTextField.text == ""  {
//    let alertController = UIAlertController(title: "Fore!", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
//    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//    alertController.addAction(alertAction)
//    self.present(alertController, animated: true, completion: nil)
//    
//    return
//    }
//    self.performSegue(withIdentifier: "loginToTab", sender: nil)
//    })
    }
}
