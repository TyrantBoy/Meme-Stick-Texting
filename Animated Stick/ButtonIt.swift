//
//  ButtonIt.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/26/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonIt: UIButton {
    
    @IBInspectable var colorBackground: UIColor = UIColor.black {
        didSet {
            self.backgroundColor = colorBackground
        }
    }
    
    @IBInspectable var newRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = newRadius
        }
    }
    
    
}
