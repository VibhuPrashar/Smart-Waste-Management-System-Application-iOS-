//
//  SignInViewController.swift
//  E-DustbinAdmin
//
//  Created by Vibhu Prashar on 07/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit

import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupElements()
      
    }
    
    
    func setupElements()
    {
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signInButton)
    }

    func validateFields() ->String?
    {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please Fill in All the Fields"
        }
        return nil
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        let error = validateFields()
        if error != nil{
            showErrorMessage(error!)
        }
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil
            {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                
                
                
            }
        }
    }
    
    func showErrorMessage(_ message: String)
    {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
}
