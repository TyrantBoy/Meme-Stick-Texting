//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Donald Nguyen on 8/19/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import Messages


protocol Category {
    func setCategory(_ segmentIndex : Int)
}

class MessagesViewController: MSMessagesAppViewController {
    
    @IBAction func categorySelect(_ sender: UIButton) {
        childViewControllers.forEach({ vc in
            guard let vc = vc as? Category else {return}
            vc.setCategory(sender.tag)
        })
    }
    
}
