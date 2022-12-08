//
//  MovieTableViewCell.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieArray: [PicInfo] = DataModel.shared.setCountryArrayUp()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .blue
        setupCell()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCollectionView() {
        self.movieCollectionView.register(PicWithNameCollectionViewCell.self, forCellWithReuseIdentifier: PicWithNameCollectionViewCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        contentView.addSubview(movieCollectionView)
    }
    
    func setupCell() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        movieCollectionView.collectionViewLayout = layout
    }
 
}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicWithNameCollectionViewCell", for: indexPath) as? PicWithNameCollectionViewCell else { return UICollectionViewCell()}
        
        cell.pic.image = self.movieArray[indexPath.row].pic
        cell.nameLB.text = self.movieArray[indexPath.row].name
        cell.nameLB.font = UIFont(name: "Impact", size: 20)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
