//
//  ContactDataCellView.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit
import Kingfisher


enum SelectedButtonTag: Int {
    case mEmailButton = 0
    case mRegisterNumberButton
    case mGenderButton
    case mCellButton
}

class ContactDataCellView: UITableViewCell {
    
    static let cellIdentifier = String(describing: ContactDataCellView.self)
    static let cellHeight: CGFloat = 120
    
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelUserName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    @IBOutlet weak var mLabelSalt: UILabel!
    @IBOutlet weak var mLabelGender: UILabel!
    @IBOutlet weak var mLabelCell: UILabel!
    
    @IBAction func onActionPressed (_ sender:UIButton)  {
        switch sender.tag {
        case SelectedButtonTag.mEmailButton.rawValue:
            print("\(String(describing: mLabelEmail.text ?? "")) ")
            
        case SelectedButtonTag.mRegisterNumberButton.rawValue:
            print("\(String(describing: mLabelSalt.text ?? ""))")
            
        case SelectedButtonTag.mGenderButton.rawValue:
            print("\(String(describing: mLabelGender.text ?? ""))")
            
        case SelectedButtonTag.mCellButton.rawValue:
            print("\(String(describing: mLabelCell.text ?? ""))")
            
        default:
            return print("default")
        }
    }
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelUserName.text = nil
        mLabelEmail.text = nil
        mLabelSalt.text = nil
        mLabelGender.text = nil
        mLabelCell.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    
    func configureCell(image: String? = nil,
                       username: String? = nil,
                       email: String? = nil,
                       salt: String? = nil,
                       gender: String? = nil,
                       cell: String? = nil) {
        if let url = URL(string: image ?? "") {
            mImage.kf.setImage(with: url)
        }
        
        mLabelUserName.text = username
        mLabelEmail.text = email
        mLabelSalt.text = salt
        mLabelGender.text = gender
        mLabelCell.text = cell
    }
}
    

