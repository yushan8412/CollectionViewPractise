//
//  CollectionViewFunctionVC.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/5.
//

import Foundation
import UIKit

class CollectionViewFunctionVC: UIViewController {
    
    // MARK: - property
    var collectionView: UICollectionView?
    
    var fullScreenSize: CGSize = UIScreen.main.bounds.size
    
//    var countryPicArray: [PicInfo] = DataModel.shared.setCountryArrayUp()
    
    var newArray: [PicInfo] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - methods
    
    func setupUI() {
        setupCollectionView()
        setArray()
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: (view.frame.width/3) - 3,
                                 height: (view.frame.width/3) - 3)
        // 每一行的 spacing
        layout.minimumLineSpacing = 1
        // 每個 item 之間的 spacing
        layout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: fullScreenSize.width,
                                                        height: fullScreenSize.height - 100),
                                          collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(IGCollectionViewCell.self, forCellWithReuseIdentifier: IGCollectionViewCell.identifier)

        self.view = view
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
        
    }
    
    func setArray() {
        self.newArray = DataModel.shared.setCountryArrayUp()
    }
    
}

// MARK: - Collection D&D
extension CollectionViewFunctionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGCollectionViewCell.identifier, for: indexPath) as? IGCollectionViewCell else { return UICollectionViewCell()}
        
        cell.pic.image = newArray[indexPath.row].pic
        
        return cell
    }
    
    
    
}

// MARK: - layout
//extension CollectionViewFunctionVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.width/3) - 3,
//                      height: (view.frame.width/3) - 3)
//    }

//}
