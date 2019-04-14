//
//  LoginViewController.swift
//  InClass11
//
//  Created by Shehab, Mohamed on 3/27/19.
//  Copyright © 2019 UNCC. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }
    
    
    
    @IBAction func logInClicked(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "You must enter both fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        } else{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){(authResult, error) in
                
                if error == nil{
                    print("success")
                    AppDelegate.showPhotos()
                } else{
                    print("error")
                    let alert = UIAlertController(title: "Error", message: "Incorrect Credentials", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "try again", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
        
        AppDelegate.showPhotos()
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        AppDelegate.showSignUp()
    }
    
}
