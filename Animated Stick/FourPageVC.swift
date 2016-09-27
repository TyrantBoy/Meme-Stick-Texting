//
//  FourPageVC.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/26/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class FourPageVC: UIViewController {
    
    @IBOutlet weak var dabView: UIImageView!
    var dabImages : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...57 {
            dabImages.append(UIImage(named: "800\(i)")!)
        }
        
        
        dabView.animationImages = dabImages
        dabView.animationDuration = 3.0
        dabView.startAnimating()
    }
}
