//
//  StickerView.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 9/8/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import Messages

@IBDesignable
class StickerView: MSStickerView {

    @IBInspectable weak var cellColor: UIColor? {
        didSet {
            self.layer.backgroundColor = cellColor?.cgColor
        }
    }
    
    @IBInspectable weak var cellImage: UIImage? {
        didSet {
            self.layer.contents  = cellImage?.cgImage
        
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderRadius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = borderRadius
        }
    }

}
