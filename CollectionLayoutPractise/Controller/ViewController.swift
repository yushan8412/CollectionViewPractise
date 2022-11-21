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
        btn.setTitle(" test1 ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .cyan
        return btn
    }()
    
    var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle(" test2 ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    var countryArray: [UIImage] = []
    var moviewArray: [movie] = []
    
// MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
// MARK: - UI
    
    func configureUI() {
        view.addSubview(btn1)
        view.addSubview(btn2)
        setupBtn1()
        setupBtn2()
        setArrayUp()
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
        let vc = IGHomePageViewController()
        vc.modalPresentationStyle = .overFullScreen
        if sender == btn1 {
            vc.countryPicArray = self.countryArray
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            
            print("tapped btn2")
            
        }
    }
    func setArrayUp() {
        guard let image = UIImage(named: "spain") else { return }
        self.countryArray.append(image)
        
        self.countryArray = [UIImage(named: "spain")!, UIImage(named: "france")!, UIImage(named: "germany")!, UIImage(named: "netherlands")! ]
        
    }


}

