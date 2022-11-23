//
//  CollectionViewInTableViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/23.
//

import UIKit

class CollectionViewInTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var countryArray = DataModel.shared.setCountryArrayUp()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupCell()
        contentView.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - method
    func setupCollectionView() {
        self.collectionView.register(IGCollectionViewCell.self, forCellWithReuseIdentifier: IGCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        contentView.addSubview(collectionView)
        
    }
    
    func setupCell() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: contentView.frame.height * 2, height: (contentView.frame.height) - 10 )
//        collectionView.collectionViewLayout = layout
    }
}

extension CollectionViewInTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGCollectionViewCell.identifier,
                                                            for: indexPath) as? IGCollectionViewCell else { return UICollectionViewCell()}
        cell.pic.image = countryArray[indexPath.row].pic
        return cell
    }
    
    
}
