//
//  CviewInTView.swift
//  CollectionLayoutPractise
//
//  Created by Yulia on 2022/11/23.
//

import Foundation
import UIKit

class CInTViewController: UIViewController {
    
    // MARK: - Property
    var countryArray: [PicInfo] = []
    var beachArray: [PicInfo] = []
    var movieArray: [PicInfo] = []
    
    var tableView = UITableView()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                         bottom: self.view.bottomAnchor, right: view.rightAnchor, paddingTop: 0,
                         paddingLeft: 0, paddingBottom: 0 ,paddingRight: 0 )
        self.tableView.register(CollectionViewInTableViewCell.self, forCellReuseIdentifier: "CollectionViewInTableViewCell")
        self.tableView.register(UINib(nibName:"CollectionViewInTableViewCell", bundle:nil),
                                   forCellReuseIdentifier:"CollectionViewInTableViewCell")
    
    }
    
}

// MARK: - tableView
extension CInTViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewInTableViewCell", for: indexPath) as? CollectionViewInTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return " Country"
        case 1:
            return " Movie"
        case 2:
            return " Beach"
            
        default:
            return " Any"
        }
        
    }
    
}
