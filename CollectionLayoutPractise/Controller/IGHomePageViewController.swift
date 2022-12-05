//
//  IGHomePageViewController.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/18.
//

import UIKit

class IGHomePageViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: peroerty
    var collectionView: UICollectionView?
    
    var fullScreenSize: CGSize = UIScreen.main.bounds.size
        
    let imagePicker = UIImagePickerController()
    
    var countryPicArray: [PicInfo] = []
    
    var beachPicArray: [PicInfo] = []
    
    var addPicBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "add"), for: .normal)
        btn.setTitle("", for: .normal)
        return btn
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // 未來可以加入
//        imagePicker.delegate = self
        view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .black
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }

    func configureUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: (view.frame.width/3) - 3,
                                 height: (view.frame.width/3) - 3)
//        layout.scrollDirection = .horizontal
        // 每一行的 spacing
        layout.minimumLineSpacing = 1
        // 每個 item 之間的 spacing
        layout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: fullScreenSize.width,
                                                        height: fullScreenSize.height - 100),
                                          collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(IGCollectionViewCell.self, forCellWithReuseIdentifier: IGCollectionViewCell.identifier)

        self.view = view
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .twitterBlue
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    func setupAddBtn() {
        view.addSubview(addPicBtn)
        self.view = view
        addPicBtn.imageView?.contentMode = .scaleAspectFill
        addPicBtn.anchor( bottom: view.bottomAnchor, right: view.rightAnchor,
                          paddingBottom: 50, paddingRight: 20, width: 40, height: 40)
        addPicBtn.addTarget(self, action: #selector(tappedAddBtn), for: .touchUpInside)
    }
    
    // imagePicker 未來可以加入
    @objc func tappedAddBtn() {
        self.imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }

}

// MARK: - collectionView
extension IGHomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return countryPicArray.count
        case 1:
            return beachPicArray.count
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGCollectionViewCell.identifier, for: indexPath) as? IGCollectionViewCell else { return UICollectionViewCell()}
        cell.pic.image = countryPicArray[indexPath.row].pic
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

// MARK: collectionView 的其他 UI 設定
extension IGHomePageViewController: UICollectionViewDelegateFlowLayout {
    
}

// MARK: - ImagePicker
// 未來可以加入
//extension IGHomePageViewController: UIImagePickerControllerDelegate {
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            self.beachPicArray.append(image)
//        }
//        picker.dismiss(animated: true)
//        viewWillAppear(true)
//    }
//}
