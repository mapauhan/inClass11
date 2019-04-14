//
//  SignUpViewController.swift
//  InClass11
//
//  Created by Shehab, Mohamed on 3/27/19.
//  Copyright © 2019 UNCC. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (authResult, error) in
            if error == nil {
                print("Succes!")
                //AppDelegate.showContacts()
            } else {
                print("error \(error)")
            }
    }
}
    
    @IBAction func createAccountClicked(_ sender: Any) {
        if emailTextField.text == "" || nameTextField.text == "" || passwordTextField.text == ""  {
            let alert = UIAlertController(title: "Error", message: "You must enter all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (authResult, error) in
                if error == nil {
                    print("Succes!")
                    //AppDelegate.showContacts()
                } else {
                    print("error \(error)")
                    let alert = UIAlertController(title: "Error", message: "\((error?.localizedDescription)!)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                }
            }
        
        AppDelegate.showPhotos()
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        AppDelegate.showLogin()
    }
    
}
