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
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extension TableView methods
extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
                                                        return PersonTableViewCell()
        }
        
        
        return cell
    }
}


// MARK: - Extension CollectionView methods
extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? PersonCollectionViewCell else {
                                                                return UICollectionViewCell()
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