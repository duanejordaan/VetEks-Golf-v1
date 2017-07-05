//
//  ViewController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/19.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loginToTab", sender: nil)
            
        }
    }
    

    

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        AuthService.signIn(email: emailTextField.text!, password: passwordTextField.text!, onSuccess: {
            self.performSegue(withIdentifier: "loginToTab", sender: nil)
        },  onError: { error in
            print(error!)
        })
}
}
