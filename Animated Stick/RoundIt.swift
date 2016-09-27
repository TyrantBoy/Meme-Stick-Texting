//
//  RoundIt.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/23/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class RoundIt: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    /*
    
    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor {
        didSet {
            layer.shadowColor = shadowColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5.0, height: 5.0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 1.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    } */
    
    
        
    override func layoutSubviews() {
        super.layoutSubviews()
        /*
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true */

    }
}
