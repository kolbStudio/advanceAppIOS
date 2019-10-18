//
//  UserDetailsViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

enum TablePosition {
case Map
case PersonalData
case Country
case contactData
    
}
class UserDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onActionPressed (_ sender:UIButton)  {
        
    }
    
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
}

