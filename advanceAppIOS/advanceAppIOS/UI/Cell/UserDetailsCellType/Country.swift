//
//  Country.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

enum SelectedButtonsTag: Int {
    case mStateButton = 0
    case mCityButton
    case mPostalCodeButton
    
}

class Country: UITableViewCell {
    static let cellIdentifier = String(describing: Country.self)
    static let cellHeight: CGFloat = 200

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabelNationalityEmoji: UILabel!
    @IBOutlet weak var mLabelCountry: UILabel!
    @IBOutlet weak var mLabelState: UILabel!
    @IBOutlet weak var mLabelCity: UILabel!
    @IBOutlet weak var mLabelPostalCode: UILabel!
    
    @IBAction func onActionPressed (_ sender:UIButton)  {
        switch sender.tag {
        case SelectedButtonsTag.mStateButton.rawValue:
            print("\(String(describing: mLabelState.text ?? "")) ")
        case SelectedButtonsTag.mCityButton.rawValue:
            print("\(String(describing: mLabelCity.text ?? ""))")
        case SelectedButtonsTag.mPostalCodeButton.rawValue:
            print("\(String(describing: mLabelPostalCode.text ?? ""))")
        default:
            return print("default")
        }
    }
    
    
    override func prepareForReuse() {
        mLabelNationalityEmoji.text = nil
        mLabelCountry.text = nil
        mLabelState.text = nil
        mLabelCity.text = nil
        mLabelPostalCode.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    
    
    
    
    
    func configureCell(user: User) {
        
        mLabelNationalityEmoji.text = user.flag
        mLabelCountry.text = user.country
        mLabelState.text = user.state
        mLabelCity.text = user.city
        mLabelPostalCode.text = user.postalCode
        
        
        
    }
}
