//
//  StickerCollectionView.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 9/8/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit


@IBDesignable   
class StickerCollectionView: UICollectionView {

    @IBInspectable weak var viewColor : UIColor? {
        didSet {
            self.backgroundColor = viewColor
        }
    }
    
    @IBInspectable weak var viewImage : UIImage? {
        
        didSet {
            self.backgroundView = UIImageView(image: viewImage)
        }
    }
}
