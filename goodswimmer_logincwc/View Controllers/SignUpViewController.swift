//
//  SignUpViewController.swift
//  goodswimmer_logincwc
//
//  Created by madi on 3/30/20.
//  Copyright © 2020 madi. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class SignUpViewController: UIViewController {
 
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var signUpNextButton: UIButton!
    @IBOutlet weak var signUpHeaderLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //hide error label
        
        errorLabel.alpha = 0
        
        /* style elements */
        
        //style text fields using utilities helper
        Utilities.styleTextField(nameField)
        Utilities.styleTextField(userNameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        
        // style button 
        Utilities.styleButton(signUpNextButton)
        
    }
    
    //Check fields and validate that data is correct
    //If all good, return nil
    // Otherwise, return error message
    
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        //trimmingCharacters gets rid of all newlines & whitespace
        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ==  "" ||
        userNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ==  "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ==  "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ==  "" {
            return "Oops! You didn't fill everything in!"
        }
        //Check that pw is secure
        let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let secure = Utilities.isPasswordValid(cleanedPassword)
        
        if !secure {
            return "Let's make that password more secure!"
        }
        //Check that email is an email format (with @ etc)
        
        return nil //all good
    }

    //handle sign up button tap
    @IBAction func signUpTapped(_ sender: Any) {
        
        //Validate fields
        
        let error = validateFields()
        if error != nil{
            //show error message
            showError(error!)
        }
        else {
            
            //Create cleaned version of data (strip whitespace & newlines)
            let name = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = userNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password  = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //Check for errors
                if err != nil {
                    self.showError("Error creating user")
                } else {
                    //User created
                    //Store first name & last name
                    let db = Firestore.firestore()
                    // Add a new document with a generated ID
                   db.collection("users").addDocument(data: [
                        "name": name,
                        "username": username,
                        "uid": result!.user.uid
                    ]) { err in
                        if  err != nil {
                            self.showError("Whoops! Something went wrong. Our bad. Try again?")
                        }
                    }
                }
            }
            
            //Transition to home screen
            self.transitionToHome()
        }
    }
    
    func showError(_ message:String)  {
        errorLabel.text! = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController)  as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
