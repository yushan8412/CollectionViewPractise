//
//  WaterfallLayoutVC.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/5.
//

import Foundation
import UIKit

class WaterfallLayoutVC: UIViewController {
    
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
//        setupCollectionView()
        setupCollectionViewLayout()
        setArray()
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
//        layout.itemSize = CGSize(width: (view.frame.width/3) - 3,
//                                 height: (view.frame.width/3) - 3)
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
    
    // MARK: - try to use waterfall latout
    func setupCollectionViewLayout() {
        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: fullScreenSize.width,
                                                        height: fullScreenSize.height - 100),
                                          collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(IGCollectionViewCell.self, forCellWithReuseIdentifier: IGCollectionViewCell.identifier)

        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0
        
        // Set the waterfall layout to your collection view
        self.collectionView?.collectionViewLayout = layout
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
        
    }
    
    func setArray() {
        self.newArray = DataModel.shared.setCountryArrayUp()
    }
    
}

// MARK: - Collection D&D
extension WaterfallLayoutVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGCollectionViewCell.identifier, for: indexPath) as? IGCollectionViewCell else { return UICollectionViewCell()}
        
        cell.pic.image = newArray[indexPath.row].pic
        
        return cell
    }
    
}
//
//extension CollectionViewFunctionVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.width/3) - 3,
//                      height: (view.frame.width/3) - 3)
//    }
//}

extension WaterfallLayoutVC: CHTCollectionViewDelegateWaterfallLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int.random(in: 100..<300), height: Int.random(in: 200..<400))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
        return 2
    }

}
