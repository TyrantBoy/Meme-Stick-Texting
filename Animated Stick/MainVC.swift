//
//  MainVC.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/27/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var thinkView: UIImageView!
    var thinkImages: [UIImage] = []
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...105 {
            thinkImages.append(UIImage(named: "700\(i)")!)
        }
        
        thinkView.animationImages = thinkImages
        thinkView.animationDuration = 5.0
        thinkView.startAnimating()
        
    }
    
    @IBAction func tutorial(_ sender: AnyObject) {
        performSegue(withIdentifier: "tutorial", sender: nil)
    }
    
    @IBAction func rateMe(_ sender: AnyObject) {
        //
        
        let appURL = URL(string: "https://itunes.apple.com/us/app/meme-stick-texting-animated/id1154126295?mt=8?app=messages")
        UIApplication.shared.open(appURL!, options: [:] , completionHandler: nil)
    }
    
    @IBAction func unwindToMaincVC(_sender: UIStoryboardSegue) {
        
    }
    
}
