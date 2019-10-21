//
//  UserDetailsViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit



class UserDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    
    private enum TablePosition: Int {
        case contactDataCellView
        case Country
        case Map
        case PersonalData
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onActionPressed (_ sender:UIButton)  {
        let alert = UIAlertController(title: "Eliminar Estudiante", message: "Seguro Quieres eliminar Estudiante?", preferredStyle: .alert)
              
             
              
              alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { [weak self] _ in
            
              //  DataManager.removeAll(where: {$0.name  == self?.User?.name ?? ""})
                  
                  
              self?.navigationController?.popViewController(animated: true)
                  
              }))
              
              alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
                  
              
              
               present(alert, animated: true)
        }
        
    private let cellTypes = [TablePosition.contactDataCellView,
                             TablePosition.Country,
                             TablePosition.Map,
                             TablePosition.PersonalData]
    
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
        
        switch cellTypes[indexPath.row] {
        case .contactDataCellView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataCellView.cellIdentifier,
                                                           for: indexPath) as? ContactDataCellView else{
                                                            return UITableViewCell()
            }
            
            cell.configureCell(image: user?.avatar,
                               username: user?.username,
                               email: user?.email,
                               salt: user?.salt,
                               gender: user?.gender,
                               cell: user?.cell)
            
            cell.selectionStyle = .none
            return cell
            
        case .Country:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Country.cellIdentifier,
                                                           for: indexPath) as? Country, let realUser = user else{
                                                            return UITableViewCell()
            }
            
            cell.configureCell(user: realUser)
            
            cell.selectionStyle = .none
            return cell
        case .Map:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Map.cellIdentifier,
                                                           for: indexPath) as? Map else{
                                                            return UITableViewCell()
            }
            cell.configure(latitude: "", longitude: "")
            
            cell.selectionStyle = .none
            return cell
        case .PersonalData:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalData.cellIdentifier,
                                                           for: indexPath) as? PersonalData else {
                                                            
                                                            return UITableViewCell()
            }
            cell.configureCell(image: user?.avatar,
                               name: user?.firstName,
                               subtitle: user?.email,
                               birthdate: user?.birthdate)
            
            cell.selectionStyle = .none
            
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
        
        tableView.register(UINib(nibName: ContactDataCellView.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: ContactDataCellView.cellIdentifier)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case TablePosition.contactDataCellView.rawValue:
            return ContactDataCellView.cellHeight
        case TablePosition.Country.rawValue:
            return Country.cellHeight
        case TablePosition.Map.rawValue:
            return Map.cellHeight
        case TablePosition.PersonalData.rawValue:
            return PersonalData.cellHeight
        default:
            return 0
            
        }
          
    }
   
}



