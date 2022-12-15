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
//        let font = UIFont(name: "Impact", size: 20)
        lb.textColor = .black
        lb.font = UIFont(name: "Impact", size: 20)
//        let attributedText = NSMutableAttributedString(string: "Text.", attributes: [.foregroundColor: UIColor.black, .font: font])

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
        transformToLarge()
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
        pic.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nameLB.topAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        pic.contentMode = .scaleAspectFill
        pic.layer.cornerRadius = 20
        nameLB.anchor(top: pic.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 5, paddingBottom: 10, height: 20)
        nameLB.centerX(inView: pic, paddingTop: 5)
        nameLB.font = UIFont(name: "Bradly hand", size: 30)
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.layer.borderColor = UIColor.gray.cgColor
        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

}
