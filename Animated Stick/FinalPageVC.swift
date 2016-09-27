//
//  FinalPageVC.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/26/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class FinalPageVC: UIViewController {
    
    @IBOutlet weak var celebrateView: UIImageView!
    @IBOutlet weak var sunglassView: UIImageView!
    @IBOutlet weak var roofView: UIImageView!
    @IBOutlet weak var saiyanView: UIImageView!
    @IBOutlet weak var jumpropeView: UIImageView!
    
    var celebrateImages : [UIImage] = []
    var sunglassImages : [UIImage] = []
    var roofImages : [UIImage] = []
    var saiyanImages : [UIImage] = []
    var jumpropeImages : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...28 {
            celebrateImages.append(UIImage(named: "Celebrate\(i)")!)
        }
        
        for i in 1...60 {
            sunglassImages.append(UIImage(named: "200\(i)")!)
        }
        
        for i in 0...28 {
            roofImages.append((UIImage(named: "output-\(i)"))!)
        }
        
        for i in 1...23 {
            saiyanImages.append((UIImage(named: "Saiyan0\(i)"))!)
        }
        
        for i in 1...14 {
            jumpropeImages.append((UIImage(named: "6000\(i)"))!)
        }
        
        celebrateView.animationImages = celebrateImages
        celebrateView.animationDuration = 1.5
        celebrateView.startAnimating()
        
        sunglassView.animationImages = sunglassImages
        sunglassView.animationDuration = 2.0
        sunglassView.startAnimating()
        
        roofView.animationImages = roofImages
        roofView.animationDuration = 1.5
        roofView.startAnimating()
        
        saiyanView.animationImages = saiyanImages
        saiyanView.animationDuration = 1.5
        saiyanView.startAnimating()
        
        jumpropeView.animationImages = jumpropeImages
        jumpropeView.animationDuration = 0.7
        jumpropeView.startAnimating()
        
    }
    
    @IBAction func ok(_ sender: AnyObject) {
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
}
