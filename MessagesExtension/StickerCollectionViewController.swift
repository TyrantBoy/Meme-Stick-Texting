//
//  StickerCollectionViewController.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 8/19/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import Messages

class StickerCollectionViewController: UICollectionViewController {
    var stickers = [MSSticker]()
    
    let stickerNames = ["CandyCane", "Caramel", "ChocolateBar", "ChocolateChip", "DarkChocolate", "GummiBear", "JawBreaker", "Lollipop", "SourCandy"]
    
    override func viewDidLoad() {
        loadStickers()
        print("\n \(stickers.description)")
        
        collectionView?.backgroundColor = #colorLiteral(
            red:  0.9490196078, green: 0.7568627451,
            blue: 0.8196078431, alpha: 1)
    }
}


extension StickerCollectionViewController {
    private func loadStickers(_ chocoholic: Bool = false) {
        stickers = stickerNames.filter({ name in
            return chocoholic ? name.contains("Chocolate") : true
        }).map ({ name in
            let url = Bundle.main.urlForResource(name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
    }
}

//MARK: CollectionViewLayout
extension StickerCollectionViewController {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let edge = min(collectionView.bounds.width / 3, 136)
        return CGSize(width: edge, height: edge)
    }
}

//MARK: DataSource
extension StickerCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView:
        UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "StickerCollectionViewCell",
            for: indexPath) as! StickerCollectionViewCell
        let sticker = stickers[indexPath.row]
        cell.stickerView.sticker = sticker
        return cell

    }
}

//MARK: Protocol 
extension StickerCollectionViewController: Chocoholicable {
    func setChocoholic(_ chocoholic: Bool) {
        loadStickers(chocoholic)
        collectionView?.reloadData()
    }
}
