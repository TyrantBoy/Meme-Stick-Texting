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



@IBDesignable
class StickerCollectionViewController: UICollectionViewController {
    
    var stickerCategories = [StickerCategory]()
    var categoryName = ""
    
    var testCategories: [String: [URL]] {
        return stickerNamesWithCategories()
    }
    
    
    override func viewDidLoad() {
        loadStickers()
      collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //print("\n \(testCategories)")
    }
}


extension StickerCollectionViewController {
    
     func loadStickers(_ segmentIndex: Int = 0) {
        
        switch segmentIndex {
        case 0:
            categoryName = "Dance"
        case 1:
            categoryName = "Fight"
        case 2:
            categoryName = "Sports"
        default:
            break
        }
        
        stickerCategories = testCategories.filter({ (name, _) in
            return name == categoryName
        }).map { (name, stickerNames) in
            let stickers : [MSSticker] = stickerNames.map { url in
                return try! MSSticker(contentsOfFileURL: url, localizedDescription: url.lastPathComponent)
            }
            
            return StickerCategory(name: name, members: stickers)
        }
        
        //startAnimating()
        
    }
}

//MARK: Directory Helper Methods
extension StickerCollectionViewController {
    func getContentsFromFolderCategory(path: String) -> [String] {
        guard let paths = try? FileManager.default.contentsOfDirectory(atPath: path) else {return [""]}
        return paths
    }
    
    func getContentsURLsFromFolderCategory(path: URL) -> [URL]? {
        guard let paths = try? FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: [URLResourceKey.nameKey], options: [.skipsHiddenFiles] )
            else { return nil }
        return paths
    }
    func getNamesFromURLs(names : [NSURL]) -> [String] {
        let nameExtract = names.flatMap({ $0.lastPathComponent })
        return nameExtract
    }
    
    func getFolderCategoryURLs() -> [NSURL] {
        
        var fileNameURL: [NSURL] = []

        let directoryURL = Bundle.main.resourceURL?.appendingPathComponent("Categories", isDirectory: true)
        
        let resourceKeys = [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey]
        let de = FileManager.default.enumerator(at: directoryURL!, includingPropertiesForKeys: resourceKeys, options: [.skipsHiddenFiles], errorHandler: nil)!
        
        for case let fileURL as NSURL in de {
            
            guard let resourceValues = try? fileURL.resourceValues(forKeys: resourceKeys),
                
                let isDirectory = resourceValues[URLResourceKey.isDirectoryKey] as? Bool
               // let name = resourceValues[URLResourceKey.nameKey] as? String
                else { continue }
            
            if isDirectory {
                fileNameURL.append(fileURL)
            }
        }
        return fileNameURL
    }
    
    func stickerNamesWithCategories() -> [String : [URL]] {
        var newDictionary : [String: [URL]] = [:]

        let folderURLs = getFolderCategoryURLs() // [NSURL]
        let directoryNames = getNamesFromURLs(names: folderURLs) //[String]
      
        
        for(index, element) in directoryNames.enumerated() {
            if let fileExists = getContentsURLsFromFolderCategory(path: folderURLs[index] as URL) {
                newDictionary[element] = fileExists
            }
        }
        return newDictionary
    }
    
}

//MARK: CollectionViewLayout

//min spacing in Sticker Collection View 1x1, so we - 2 width 
extension StickerCollectionViewController {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let edge = min((collectionView.bounds.width - 2) / 3, 136)
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
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? StickerCollectionViewCell {
         cell.stickerView.stopAnimating()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? StickerCollectionViewCell {
            cell.stickerView.startAnimating()
        }
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

//MARK: ScrollView

/*
extension StickerCollectionViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       var offSet = scrollView.contentOffset
       var bounds = scrollView.bounds
       var cells = collectionView?.visibleCells
        
        var cell : StickerCollectionView
     //   for cell in cells {
   //     }
        
        
        print(offSet)
        print(bounds)
    }

 
} */


//MARK: Protocol 
extension StickerCollectionViewController: Category {
    func setCategory(_ segmentIndex: Int) {
        loadStickers(segmentIndex)
        collectionView?.reloadData()
        
        ////////////
      //  print(stickerCategories.count)
        //print(stickerCategories.description)
    }
}
