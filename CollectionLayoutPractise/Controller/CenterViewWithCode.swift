//
//  CenterViewWithCode.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/12.
//

import Foundation
import UIKit

class CenterViewWithCode: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var fullScreenSize: CGSize = UIScreen.main.bounds.size

    var collectionView: UICollectionView?
    
    var picData = DataModel.shared.setCountryArrayUp()
    
    var centerCell: PicWithNameCollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    
    
    
    func setupCollectionView() {
        let layout = MyFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: fullScreenSize.width,
                                                        height: (fullScreenSize.height)/2),
                                          collectionViewLayout: layout)
        self.collectionView?.register(PicWithNameCollectionViewCell.self, forCellWithReuseIdentifier: PicWithNameCollectionViewCell.identifier)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
    }
}

extension CenterViewWithCode: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicWithNameCollectionViewCell", for: indexPath) as? PicWithNameCollectionViewCell else { return UICollectionViewCell() }
        
        cell.pic.image = picData[indexPath.row].pic
        cell.nameLB.text = picData[indexPath.row].name
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 30
        return cell
    }
    
    // Zoom the center item
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard scrollView is UICollectionView else { return }
//
//        let centerPoint = CGPoint(x: self.collectionView?.frame.size.width ?? 0/2 + scrollView.contentOffset.x,
//                                  y: self.collectionView?.frame.size.height ?? 0/2 + scrollView.contentOffset.y)
//        guard let indexPath2 = self.collectionView?.indexPathForItem(at: centerPoint) else { print("失敗"); return }
//
//        self.centerCell = self.collectionView?.cellForItem(at: indexPath2) as! PicWithNameCollectionViewCell
//        centerCell.transformToLarge()
    
//
//        if let indexPath = self.collectionView!.indexPathForItem(at: centerPoint) {
//            self.centerCell = self.collectionView?.cellForItem(at: indexPath) as! PicWithNameCollectionViewCell
//            // call the zoom in function
//            centerCell.transformToLarge()
//        } else {
//            print("失敗～～")
//        }
//    }
    
    
    // 成功
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = collectionView?.collectionViewLayout as! MyFlowLayout
        // 一次會顯示的 spacing(cell + 左右兩邊)
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing // spacing between row

        let centerPoint = CGPoint(x: self.collectionView?.frame.size.width ?? 0/2 + scrollView.contentOffset.x,
                                  y: self.collectionView?.frame.size.height ?? 0/2 + scrollView.contentOffset.y)
        var offset = targetContentOffset.pointee
        
// test
        let itemSize = CGSize(width: 350, height: 320)
        let xCenterOffset = targetContentOffset.pointee.x + (itemSize.width / 2.0)
        let indexPath2 = IndexPath(item: Int(xCenterOffset / (itemSize.width + 10 / 2.0)), section: 0)

        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index) // round() 將一個數變成整數
        // 將 cellWidthIncludingSpacing 乘上 index 來算出要 scroll 到哪裡,
        offset = CGPoint(x: (roundedIndex * cellWidthIncludingSpacing) - scrollView.contentInset.left,
                         y: scrollView.contentInset.top)
        // 把整數的 offset 指回 pointee
        targetContentOffset.pointee = offset
        
    // Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        self.centerCell = self.collectionView?.cellForItem(at: indexPath2) as? PicWithNameCollectionViewCell
        centerCell?.transformToLarge()
        
        let testCell = self.centerCell
        let offsetX = (centerPoint.x) * roundedIndex - (testCell?.center.x ?? 0)
        if offsetX < -130 || offsetX > 130 {
            testCell?.transformToStander()
            self.centerCell = nil
        }
    }
  
}


