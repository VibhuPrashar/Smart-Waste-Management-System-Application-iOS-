//
//  AnimationViewController.swift
//  D1
//
//  Created by Vibhu Prashar on 25/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {


   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimation()
        
       
    }
    
    func startAnimation()
       {
           
           let animationView = LOTAnimationView.init(name:"signinAni")
       // animationView.frame = CGRect(x: 0,y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        self.view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 1))
        self.view.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 1))
        animationView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200))
        animationView.addConstraint(NSLayoutConstraint(item: animationView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200))
        animationView.contentMode = .scaleAspectFit
           animationView.loopAnimation = true
           
           
           
           animationView.play()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+8) {
                        self.performSegue(withIdentifier: "nextPage1", sender: nil)
                    }
          
           
           
       }

    

}
