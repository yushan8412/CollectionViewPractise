//
//  IGCollectionViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/21.
//

import UIKit

class IGCollectionViewCell: UICollectionViewCell {
    
    // MARK: property

    static let identifier = "IGCollectionViewCell"
    var pic: UIImageView = {
        let pic = UIImageView()
        pic.contentMode = .scaleAspectFill
        pic.clipsToBounds = true
        return pic
    }()
    

    // life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pic)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pic.frame = contentView.bounds
//        pic.layer.cornerRadius = 20
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pic.image = nil
    }
}
