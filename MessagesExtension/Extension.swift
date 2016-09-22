//
//  FirstTime.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 9/21/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import Foundation

extension UserDefaults {
    func isFirstLaunch() -> Bool {
        if !(UserDefaults.standard.bool(forKey: "LaunchedOnce")) {
            UserDefaults.standard.set(true, forKey: "LaunchedOnce")
            UserDefaults.standard.synchronize()
            return true
        } else {
            return false
        }
    }
}
