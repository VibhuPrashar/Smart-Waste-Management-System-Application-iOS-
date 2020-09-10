//
//  SignInVC.swift
//  D1
//
//  Created by Vibhu Prashar on 25/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.performSegue(withIdentifier: "nextPage", sender: nil)
        }
        
    }
    
}
