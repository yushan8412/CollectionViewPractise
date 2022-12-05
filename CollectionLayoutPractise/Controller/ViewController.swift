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
        btn.backgroundColor = .pGreen
        return btn
    }()
    
    var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle(" CollectionView in TableView ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .pBlue
        return btn
    }()
    
    var btn3: UIButton = {
        let btn = UIButton()
        btn.setTitle(" Waterfall layout ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .rosePink
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
        view.addSubview(btn3)
        setupBtn1()
        setupBtn2()
        setupBtn3()
        
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
    
    func setupBtn3() {
        btn3.anchor(top: btn2.bottomAnchor, paddingTop: 20)
        btn3.centerX(inView: btn1, paddingTop: 20)
        btn3.addTarget(self, action: #selector(tappedBtn), for: .touchUpInside)
        
    }
    
    @objc func tappedBtn(sender: UIButton) {
        
        if sender == btn1 {
            let vc = IGHomePageViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.countryPicArray = self.countryArray
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if sender == btn2 {
            let vc = CInTViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if sender == btn3 {
            print("did tapped btn3")
            let vc = CollectionViewFunctionVC()
            vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setDataUp() {
//        self.moviewArray = DataModel.shared.setMovieArrayUp()
        self.countryArray = DataModel.shared.setCountryArrayUp()
    }


}

