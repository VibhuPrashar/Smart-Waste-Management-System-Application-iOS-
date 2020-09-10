//
//  SignUpViewController.swift
//  E-DustbinAdmin
//
//  Created by Vibhu Prashar on 07/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElement()
       
    }
    
    
    
    func setUpElement()
    {
        errorLabel.alpha = 0
        
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }
    
    
    
    func validateFeilds() -> String?
    {
        
      
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure your password is at least 8 characters, containing special character and a number."
        }
        
        return nil
    }
    
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        let error = validateFeilds()
        
        if error != nil
        {
            errorLabel.text = error!
            errorLabel.alpha = 1
        }
        else{
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
            
            
            
            Auth.auth().createUser(withEmail: email , password: password) { (result, err) in
                
                if err != nil
                {
                    self.showError("error creating a user")
                }
                else
                {
                    let db = Firestore.firestore()
                    
                     
                    db.collection("users").addDocument(data: ["firstname" : firstName, "lastname": lastName, "uid": result?.user.uid]) { (error) in
                        
                        if error != nil
                        {
                            self.showError("User data couldn't entered")
                        }
                    }
                    
                    self.transitionToHome()
                    
                    //db.collection("users").
                    
                }
            }
            
        }

        
    }
    
    func transitionToHome()
    {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController)as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message:String)
    {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
}
