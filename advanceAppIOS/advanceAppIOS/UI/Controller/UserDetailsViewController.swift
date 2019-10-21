//
//  UserDetailsViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

enum TablePosition {
    case contactData
    case Country
    case Map
    case PersonalData
}

class UserDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onActionPressed (_ sender:UIButton)  {
        let alert = UIAlertController(title: "Eliminar Estudiante", message: "Seguro Quieres eliminar Estudiante?", preferredStyle: .alert)
              
             
              
              alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { [weak self] _ in
            
                  // User.removeAll(where: {$0.name  == self?.User?.name ?? ""})
                  
                  
              self?.navigationController?.popViewController(animated: true)
                  
              }))
              
              alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
                  
              
              
               present(alert, animated: true)
        }
        
    
    
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(tableView: tableView)
        
    }
}

// MARK: - Declare UserDetailsCell

extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactData.cellIdentifier,
                                                           for: indexPath) as? ContactData else{
                                                            return UITableViewCell()
            }
            
            cell.configureCell(image: user?.avatar,
                               username: user?.username,
                               email: user?.email,
                               registerNumber: user?,
                               gender: user?.gender,
                               cell: user?.cell)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Country.cellIdentifier,
                                                           for: indexPath) as? Country else{
                                                            return UITableViewCell()
            }
            cell.configureCell()
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Map.cellIdentifier,
                                                           for: indexPath) as? Map else{
                                                            return UITableViewCell()
            }
            cell.configureCell()
            return cell
        default:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalData.cellIdentifier,
                                                           for: indexPath) as? PersonalData else {
                                                            
                                                            return UITableViewCell()
            }
            cell.configureCell()
            
            return cell
            
        }
}
    
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.register(UINib(nibName: Map.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: Map.cellIdentifier)
        
        tableView.register(UINib(nibName: PersonalData.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: PersonalData.cellIdentifier)
        
        tableView.register(UINib(nibName: Country.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: Country.cellIdentifier)
        tableView.register(UINib(nibName: Country.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: Country.cellIdentifier)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    
    
    
}
