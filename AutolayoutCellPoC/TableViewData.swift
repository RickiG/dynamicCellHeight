//
//  TableViewData.swift
//  AutolayoutCellPoC
//
//  Created by Ricki Gregersen on 05/12/14.
//  Copyright (c) 2014 youandthegang.com. All rights reserved.
//

import Foundation

protocol CellDataProtocol {
    
}

class CellTextData: CellDataProtocol {
    
    let title: String
    let subTitle: String
    
    required init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}

class CellImageData: CellDataProtocol {

    let title: String
    let subTitle: String
    let imagePath: String
    
    required init(title: String, subTitle: String, imagePath: String) {
        self.title = title
        self.subTitle = subTitle
        self.imagePath = imagePath
    }
}

class TableViewData {
    
    var words: [String] = []
    var data: [AnyObject] = []
    let text = "Roof party McSweeney's four dollar toast, artisan mustache cardigan keytar post-ironic small batch you probably haven't heard of them Kickstarter. Aesthetic Godard hella chia typewriter gastropub, dreamcatcher taxidermy shabby chic food truck street art. Fixie VHS skateboard lomo art party, meggings viral food truck shabby chic Thundercats literally. Schlitz cardigan beard, chambray 8-bit quinoa butcher hoodie Intelligentsia stumptown chillwave shabby chic whatever. Neutra High Life actually fap, listicle raw denim aesthetic Austin Brooklyn crucifix tattooed cardigan forage seitan"
    
    var count: Int {
        get {
            return data.count
        }
    }

    func cycleData() {
        data = []
        words = []
        words = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let dataCount = Int.random(lower: 5, upper: 20)
        for _ in 0..<dataCount {
            let titleWordCount = Int.random(lower: 2, upper: 15)
            let title = stringWithNumberOfWords(titleWordCount)
            let subTitle = stringWithNumberOfWords(Int.random(lower: 20, upper: words.count))
            
            if titleWordCount % 2 == 0 {
                data.append(CellImageData(title: title, subTitle: subTitle, imagePath: "HERBERT.JPG"))
            } else {
                data.append(CellTextData(title: title, subTitle: subTitle))
            }
            
        }
    }
    
    func dataForIndexPath(indexPath: NSIndexPath) ->AnyObject {
        return data[indexPath.row]
    }
    
    func stringWithNumberOfWords(count: Int) ->String {
        let startIndex = Int.random(lower: 0, upper: words.count - count)
        let endIndex = startIndex + count
        let slice: Array<String> = Array(words[startIndex...endIndex])
        return " ".join(slice)
    }
    
}