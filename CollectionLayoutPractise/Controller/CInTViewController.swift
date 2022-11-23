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
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                         bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0,
                         paddingLeft: 0, paddingBottom: 0 ,paddingRight: 0 )
        self.tableView.register(CollectionViewInTableViewCell.self, forCellReuseIdentifier: "CollectionViewInTableViewCell")
    
    }
    
}

// MARK: - tableView
extension CInTViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewInTableViewCell", for: indexPath) as? CollectionViewInTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
