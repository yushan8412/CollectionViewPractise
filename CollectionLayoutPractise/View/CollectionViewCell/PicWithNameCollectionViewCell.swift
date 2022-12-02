//
//  PicWithNameCollectionViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/25.
//

import UIKit

class PicWithNameCollectionViewCell: UICollectionViewCell {

    // MARK: - Property
    static let identifier = "PicWithNameCollectionViewCell"
    
    var nameLB: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont(name: "Bradly hand", size: 20)
        return lb
    }()
    
    var pic: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pic)
        contentView.addSubview(nameLB)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pic.image = nil
        nameLB.text = ""
    }
    
    func setupCell() {
        pic.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nameLB.topAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 2, paddingBottom: 10, paddingRight: 2)
        pic.contentMode = .scaleAspectFill
        nameLB.anchor(top: pic.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 5, paddingBottom: 5, height: 20)
        nameLB.centerX(inView: pic, paddingTop: 5)
    }

}
