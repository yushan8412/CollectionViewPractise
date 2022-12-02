//
//  CollectionViewInTableViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/23.
//

import UIKit

// TODO: 應該要做三種 TableViewCell  然後建立三個檔案，在 tableView 那再去選擇要用哪個

class CollectionViewInTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var countryArray = DataModel.shared.setCountryArrayUp()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .systemPink
        setupCell()
        setupCollectionView()
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

extension CollectionViewInTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGCollectionViewCell.identifier,
                                                            for: indexPath) as? IGCollectionViewCell else { return UICollectionViewCell()}
        cell.pic.image = countryArray[indexPath.row].pic
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 180)
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let view = view as! UI
//    }
}
