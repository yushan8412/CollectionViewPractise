//
//  CenterItemVC.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/9.
//

import Foundation
import UIKit

class CenterItemVC: UIViewController {
    
    // property
    var collectionView: UICollectionView?
    
    var fullScreenSize: CGSize = UIScreen.main.bounds.size
    
    var dataArray = DataModel.shared.setCountryArrayUp()
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        ConfigureUI()
    }
    
    func ConfigureUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        // 這邊改用 ZoomAndSnapFlowLayout
        let layout: UICollectionViewFlowLayout = ZoomAndSnapFlowLayout()
        self.collectionView?.collectionViewLayout = layout
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: fullScreenSize.width,
                                                        height: (fullScreenSize.height)/2),
                                          collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
    
        self.collectionView?.register(IGCollectionViewCell.self, forCellWithReuseIdentifier: IGCollectionViewCell.identifier)
        
        self.collectionView?.register(PicWithNameCollectionViewCell.self, forCellWithReuseIdentifier: PicWithNameCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
        
    }
    
}

extension CenterItemVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicWithNameCollectionViewCell", for: indexPath) as? PicWithNameCollectionViewCell else { return UICollectionViewCell() }
        
        cell.pic.image = dataArray[indexPath.row].pic
        cell.nameLB.text = dataArray[indexPath.row].name
        
        return cell
    }
    
}

extension CenterItemVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (fullScreenSize.width)-100, height: (fullScreenSize.height)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
}
