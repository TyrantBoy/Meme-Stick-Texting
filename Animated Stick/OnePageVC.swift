//
//  1_PageVC.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/26/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class OnePageVC: UIViewController {
    
    var waveImages: [UIImage] = []
    
    @IBOutlet weak var waveView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 1...76 {
            waveImages.append(UIImage(named: "100\(i)")!)
        }
        waveView.animationImages = waveImages
        waveView.animationDuration = 4.0
        waveView.startAnimating()
        
        
    }

}
