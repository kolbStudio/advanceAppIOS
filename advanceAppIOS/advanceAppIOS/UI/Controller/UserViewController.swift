//
//  UserViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentOption: UISegmentedControl!
    
    //Value changed
    
    @IBAction func onListPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
                tableView.isHidden = false
                collectionView.isHidden = true
                tableView.reloadData()
        default:
           
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
        }
    }
    
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    private var userList: Array<User> = []
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get Users from DataBase
        configure(tableView: tableView)
        configure(collectionView: collectionView)
        loadUser()
    }
    
    private func loadUser(){
        
        DataManager.shared.users() {[weak self] result in
            switch result {
            case .success(let data):
                guard let users = data as? Array<User> else{
                    return
                }
                self?.userList = users
                
                switch self?.segmentOption.selectedSegmentIndex {
                case 0:
                    self?.tableView.reloadData()
                    
                default:
                    self?.collectionView.reloadData()
                }
                
            case .failure(let msg):
                print(msg)
                
                
            }
        }
    }
}



// MARK: - Extension TableView methods
extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
                                                        return PersonTableViewCell()
        }
        if(indexPath.row < userList.count) {
            let user = userList[indexPath.row]
            cell.configureCell(image: user.avatar,
                               name: user.name,
                               email: user.email)
        }
        
        return cell
    }
}


// MARK: - Extension CollectionView methods
extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configure(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: PersonCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PersonCollectionViewCell.cellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? PersonCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        if(indexPath.row < userList.count) {
            let user = userList[indexPath.row]
            cell.configureCell(image: user.avatar, title: user.name)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - cellSpacing) / 2
        return CGSize(width: size,
                      height: size)
    }
}

