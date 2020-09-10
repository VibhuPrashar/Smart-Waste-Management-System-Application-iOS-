//
//  HomeViewController.swift
//  E-DustbinAdmin
//
//  Created by Vibhu Prashar on 07/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var addDriver: UIButton!
    
    
    @IBOutlet weak var showMap: UIButton!
    
    
    @IBOutlet weak var addMessage: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpElements()
        
      
        

       
    }
    
    
    func addMessages()
    {
        ref = Database.database().reference().child("messages")
        let key = ref.childByAutoId().key
        let messages = ["id": key,"title": "this is urgent","message":"please collect the trash from here"]
        
        ref.child(key!).setValue(messages)
    }
    

    
    func setUpElements()
       {
           Utilities.styleFilledButton(addDriver)
        Utilities.styleFilledButton(showMap)
       }

    
    
    @IBAction func addDriverPressed(_ sender: Any) {
        
    }
    
    
    
    @IBAction func addMessageBtnPressed(_ sender: Any) {
        addMessages()
    }
    
}
