//
//  StickerSegmentController.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 9/10/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit


@IBDesignable
class StickerSegmentController: UISegmentedControl {

    
    @IBInspectable var segBackground: UIColor? {
        didSet {
            self.layer.backgroundColor = segBackground?.cgColor
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var segTint: UIColor? {
        didSet {
            self.tintColor = segTint
        }
    }
    
    @IBInspectable var segRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = segRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
}
