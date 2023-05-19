//
//  CenterViewWithCode.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/12.
//

import Foundation
import UIKit

class CenterViewWithCode: UIViewController, UICollectionViewDelegateFlowLayout {
    
    let layout = MyFlowLayout()
    
    var fullScreenSize: CGSize = UIScreen.main.bounds.size

    var collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width,
                                                        height: (UIScreen.main.bounds.size.height)/2),
                                          collectionViewLayout: MyFlowLayout())
    
    var picData = DataModel.shared.setCountryArrayUp()
    
    var centerCell: PicWithNameCollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let layoutMargin: CGFloat = self.collectionView.layoutMargins.left + self.collectionView.layoutMargins.right
        let sideInset = (self.view.frame.width) - layoutMargin
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }

    func setupCollectionView() {

        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        layout.contentInset
        self.collectionView.register(PicWithNameCollectionViewCell.self, forCellWithReuseIdentifier: PicWithNameCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        view.addSubview(collectionView)
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
    
//     Zoom the center item
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
   
        let centerPoint = CGPoint(x: self.collectionView.frame.size.width/2 + scrollView.contentOffset.x,
                                  y: self.collectionView.frame.size.height/2 + scrollView.contentOffset.y)


        if let indexPath = self.collectionView.indexPathForItem(at: centerPoint) {
            self.centerCell = self.collectionView.cellForItem(at: indexPath) as? PicWithNameCollectionViewCell
            // call the zoom in function
            centerCell?.transformToLarge()
        } else {
            print("失敗～～")
        }
        if let cell = self.centerCell {
            let offsetX = (centerPoint.x) - (cell.center.x)
            if offsetX < -130 || offsetX > 130 {
                cell.transformToStander()
                self.centerCell = nil
            }
            
        }
    }
    
    
    // 成功置中
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
//        let pageWidth = Float(layout.itemSize.width + layout.minimumLineSpacing)
//        let targetXContentOffset = Float(targetContentOffset.pointee.x)
//        let contentWidth = Float(collectionView.contentSize.width)
        
        guard let layout = collectionView.collectionViewLayout as? MyFlowLayout else { return }

        // 一次會顯示的 spacing(cell + 左右兩邊)
        let cellWidthIncludingSpacing = (layout.itemSize.width + layout.minimumLineSpacing/2) // spacing between row
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index) // round() 將一個數變成整數
        // 將 cellWidthIncludingSpacing 乘上 index 來算出要 scroll 到哪裡,
        offset = CGPoint(x: (roundedIndex * cellWidthIncludingSpacing), //- scrollView.contentInset.left,
                         y: scrollView.contentInset.top)
        // 把整數的 offset 指回 pointee
        targetContentOffset.pointee = offset
    }
  
}


