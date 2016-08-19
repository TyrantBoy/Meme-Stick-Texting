//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Donald Nguyen on 8/19/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import Messages


protocol Chocoholicable {
    func setChocoholic(_ chocoholic: Bool)
}

class MessagesViewController: MSMessagesAppViewController {
    
    @IBAction func handleChocoholicChange(_ sender: UISwitch) {
        childViewControllers.forEach({ vc in
            guard let vc = vc as? Chocoholicable else { return }
            vc.setChocoholic(sender.isOn)
        })
    }
  //testing
}
