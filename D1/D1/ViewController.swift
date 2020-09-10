//
//  ViewController.swift
//  D1
//
//  Created by Vibhu Prashar on 25/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startAnimation()
    }
    
    
    
    func startAnimation()
    {
        
        let animationView = LOTAnimationView.init(name:"dustbin1")
        animationView.frame = CGRect(x: 0,y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-300)
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = true
        
        self.view.addSubview(animationView)
        animationView.play()
        
        
    }


}

