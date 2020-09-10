//
//  ViewController.swift
//  E-DustbinAdmin
//
//  Created by Vibhu Prashar on 07/10/19.
//  Copyright © 2019 Vibhu Prashar. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?

    @IBOutlet weak var SignInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpElements()
    }
    
    
    func setUpElements()
    {
        Utilities.styleFilledButton(SignInButton)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        setupVideo()
    }
    
    
    func setupVideo()
    {
        let bundlePath = Bundle.main.path(forResource: "logo1", ofType: "mov")
        
        guard bundlePath != nil else
        {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y:0,width:self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.5)
        
    }
    

    @IBAction func buttonTapped(_ sender: Any) {
        
    }
}

