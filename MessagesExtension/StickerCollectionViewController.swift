//
//  StickerCollectionViewController.swift
//  MEME Texting
//
//  Created by Donald Nguyen on 8/19/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit
import Messages

struct StickerCategory {
    let name: String
    let members: [MSSticker]
}

class StickerCollectionViewController: UICollectionViewController {
    
    var stickerCategories = [StickerCategory]()
    var categoryName = ""
    
    let stickerNameCategories: [String : [String]] = [
        "Recent" : [""],
        "Expressions" : ["CandyCane", "Caramel"],
        "Funny": ["ChocolateBar", "ChocolateChip"],
        "Fighting" : ["DarkChocolate", "GummiBear"],
        "Sports" : ["JawBreaker", "Lollipop", "SourCandy"]
    
    ]
    
    override func viewDidLoad() {
        loadStickers()
        
        /*
        //get document directory url
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
   
        do{
            //get directory content urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil, options: [])
            print("\(directoryContents) + hello \n")
            

        } catch let error as NSError {
            print(error.localizedDescription)
        } */
        
        
        collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}


extension StickerCollectionViewController {
/*    private func loadStickers(_ chocoholic: Bool = false) {
        stickers = stickerNames.filter({ name in
            return chocoholic ? name.contains("Chocolate") : true
        }).map ({ name in
            let url = Bundle.main.urlForResource(name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
    } */
    
     func loadStickers(_ segmentIndex: Int = 0) {
        //var categoryName = ""
        switch segmentIndex {
            case 0:
                categoryName = "Recent"
            case 1:
                categoryName = "Expressions"
            case 2:
                categoryName = "Funny"
            case 3:
                categoryName = "Fighting"
            case 4:
                categoryName = "Sports"
            default:
                break
        }
        
        
        
        stickerCategories = stickerNameCategories.filter({ (name, _) in
            return name == categoryName
            
        }).map { (name, stickerNames) in
            let stickers : [MSSticker] = stickerNames.map { name in
                let url = Bundle.main.url(forResource: name, withExtension: "png")!
                
                /*
                print("\(url.lastPathComponent) \n")
                let names = url.lastPathComponent
                let render = (names as NSString).deletingPathExtension
                print(render)*/

                return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
            }
            
            return StickerCategory(name: name, members: stickers)
        }
        
        
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
        return stickerCategories.count
    }
    
    override func collectionView(_ collectionView:
        UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickerCategories[section].members.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "StickerCollectionViewCell",
            for: indexPath) as! StickerCollectionViewCell
        
        let sticker = stickerCategories[indexPath.section].members[indexPath.row]
        cell.stickerView.sticker = sticker
        return cell

    }
}

//MARK: Protocol 
extension StickerCollectionViewController: Category {
    func setCategory(_ segmentIndex: Int) {
        loadStickers(segmentIndex)
        collectionView?.reloadData()
        print(stickerCategories.count)
        print(stickerCategories.description)
       // print(stickerCategories[0].name)

    }
}
