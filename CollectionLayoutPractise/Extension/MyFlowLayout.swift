//
//  MyFlowLayout.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/12/14.
//

import Foundation
import UIKit

final class MyFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        scrollDirection = .horizontal
        minimumLineSpacing = 30
        minimumInteritemSpacing = 10
        itemSize = CGSize(width: 300, height: 270)
    }
    
    // try to center the item in view (成功！)
//     offset = in scrollView it means the point that when you end scrolling
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
//        // proposedContentOffset -> 滑到的位置
//        let horizontalOffset = proposedContentOffset.x + collectionView!.contentInset.left
//        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView!.bounds.size.width, height: collectionView!.bounds.size.height)
//        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
//        layoutAttributesArray?.forEach({ (layoutAttributes) in
//            // itemOffset -> 現在collectionView's width??
//            let itemOffset = layoutAttributes.frame.origin.x - minimumLineSpacing
//            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
//                offsetAdjustment = itemOffset - horizontalOffset
//            }
//        })
//        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
//    }
//
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
//        let horizontalOffset = proposedContentOffset.x + collectionView!.contentInset.left
//        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView!.bounds.size.width, height: collectionView!.bounds.size.height)
//        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
//        layoutAttributesArray?.forEach({ (layoutAttributes) in
//            let itemOffset = layoutAttributes.frame.origin.x - minimumLineSpacing
//            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
//                offsetAdjustment = itemOffset - horizontalOffset
//            }
//        })
//        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
//    }


}
