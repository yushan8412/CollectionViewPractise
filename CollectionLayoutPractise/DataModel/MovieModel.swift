//
//  MovieModel.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/21.
//

import Foundation
import UIKit

struct PicInfo {
    let pic: UIImage
    let name: String
}

class DataModel {
    
    static var shared = DataModel()
    
    func setMovieArrayUp() -> [PicInfo]{
        let lotr: PicInfo = PicInfo(pic: UIImage(named: "")!, name: "Lord of the Ring")
        let spiderMan: PicInfo = PicInfo(pic: UIImage(named: "")!, name: "SpiderMan")
        let avatar: PicInfo = PicInfo(pic: UIImage(named: "")!, name: "Avatar")
        let untolsHostory: PicInfo = PicInfo(pic: UIImage(named: "")!, name: "Untold History")
        
        let moviewArray = [lotr, spiderMan, avatar, untolsHostory]
        
        return moviewArray
    }
    
    func setCountryArrayUp() -> [PicInfo]{
        let spain = PicInfo(pic: UIImage(named: "spain")!, name: "Spain")
        let franc = PicInfo(pic: UIImage(named: "france")!, name: "France")
        let germany = PicInfo(pic: UIImage(named: "germany")!, name: "Germany")
        let netherlands = PicInfo(pic: UIImage(named: "netherlands")!, name: "Netherlands")
        let usa = PicInfo(pic: UIImage(named: "usa")!, name: "USA")
        let taiwan = PicInfo(pic: UIImage(named: "taiwan")!, name: "Taiwan")
        let japan = PicInfo(pic: UIImage(named: "japan")!, name: "Japan")
        let Korea = PicInfo(pic: UIImage(named: "korea")!, name: "Korea")
        
        let countryArray = [spain, franc, germany, netherlands, usa, taiwan, japan, Korea]
        
        return countryArray
        
    }

    
}

