//
//  CandyStickerBrowserViewController.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 8/19/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import Messages

class CandyStickerBrowserViewController: MSStickerBrowserViewController {
    //MSSticker model object represent a messages sticker
    var stickers = [MSSticker]()
    
    let stickerNames = ["CandyCane", "Caramel", "ChocolateBar",
                        "ChocolateChip", "DarkChocolate", "GummiBear",
                        "JawBreaker", "Lollipop", "SourCandy"
                        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStickers()
        stickerBrowserView.backgroundColor = #colorLiteral(red:  0.9490196078, green: 0.7568627451,
        blue: 0.8196078431, alpha: 1)
    }
    
}

extension CandyStickerBrowserViewController {
 //regular view controller
    /* private func loadStickers() {
        stickers = stickerNames.map({ name in
            let url = Bundle.main.urlForResource(name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
    } */
    
    private func loadStickers(_ chocoholic: Bool = false) {
        stickers = stickerNames.filter({ name in
            return chocoholic ? name.contains("Chocolate") : true
        }).map({ name in
            let url = Bundle.main.urlForResource(name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
    }
}

//MARK: MSStickerBrowserViewDataSource
extension CandyStickerBrowserViewController {
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
