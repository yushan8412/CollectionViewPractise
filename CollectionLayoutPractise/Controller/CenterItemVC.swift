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
        // 嘗試 fix 進入頁面的問題
//        self.collectionView?.scrollToItem(at:IndexPath(item: 0, section: 0) , at: .left, animated: true)
        
        UIView.animate(withDuration: 0.5) {
            self.collectionView?.scrollToItem(at:IndexPath(item: 1, section: 0) , at: .left, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let layoutMargin: CGFloat = (self.collectionView?.layoutMargins.left ?? 0) + (self.collectionView?.layoutMargins.right ?? 0)
        let sideInset = (self.view.frame.width) - layoutMargin
        self.collectionView?.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    func ConfigureUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {

        // 這邊改用 ZoomAndSnapFlowLayout
        // FIXME: 剛進去時 item 不會置中，但滑動過後就可以
        let layout: UICollectionViewFlowLayout = ZoomAndSnapFlowLayout()
        self.collectionView?.collectionViewLayout = layout
        
        collectionView?.isPagingEnabled = true
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: fullScreenSize.width,
                                                        height: (fullScreenSize.height)/2),
                                          collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        self.collectionView?.contentInsetAdjustmentBehavior = .always

    
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
