//
//  beachTableViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/24.
//

import UIKit

class beachTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var beachArray: [PicInfo] = DataModel.shared.setCountryArrayUp()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = .orange
        setupCollectionView()
        setupCell()
        
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
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    
}

extension beachTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beachArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IGCollectionViewCell", for: indexPath) as? IGCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.pic.image = beachArray[indexPath.row].pic
        
        return cell
    }
    
    
}
