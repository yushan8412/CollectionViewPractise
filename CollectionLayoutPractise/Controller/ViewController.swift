//
//  ViewController.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {

// MARK: - property
    var btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle(" Basic CollectionView ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()
    
    var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle(" CollectionView in TableView ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    var countryArray: [PicInfo] = []
    var moviewArray: [PicInfo] = []
    var beachArray: [PicInfo] = []
    
// MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setDataUp()
    }
    
// MARK: - UI
    
    func configureUI() {
        view.addSubview(btn1)
        view.addSubview(btn2)
        setupBtn1()
        setupBtn2()
        
    }
    
    func setupBtn1() {
        btn1.center(inView: view)
        btn1.addTarget(self, action: #selector(tappedBtn), for: .touchUpInside)
    }
    
    func setupBtn2() {
        btn2.anchor(top: btn1.bottomAnchor, paddingTop: 20)
        btn2.centerX(inView: btn1, paddingTop: 20)
        btn2.addTarget(self, action: #selector(tappedBtn), for: .touchUpInside)
        
    }
    
    @objc func tappedBtn(sender: UIButton) {
        
        if sender == btn1 {
            let vc = IGHomePageViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.countryPicArray = self.countryArray
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            print("did tapped")
            let vc = CInTViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: true)
                        
        }
    }
    
    func setDataUp() {
//        self.moviewArray = DataModel.shared.setMovieArrayUp()
        self.countryArray = DataModel.shared.setCountryArrayUp()
    }


}

