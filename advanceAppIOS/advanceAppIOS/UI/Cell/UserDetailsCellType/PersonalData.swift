//
//  PersonalData.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//


import UIKit
import Kingfisher

class PersonalData: UITableViewCell {
    static let cellIdentifier = String(describing: PersonalData.self)
    static let cellHeight: CGFloat = 120

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    @IBOutlet weak var mLabelBirthdate: UILabel!
    

    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
        mLabelBirthdate.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
        
        
    }
    
    func configureCell(image: String? = nil, name: String? = nil, subtitle: String? = nil, birthdate: Date? = nil) {
        let url = URL(string: image ?? "")
        mImage.kf.setImage(with: url)
        mLabelName.text = name
        mLabelEmail.text = subtitle
        
        if let birthdateValue = birthdate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            mLabelBirthdate.text = dateFormatter.string(from: birthdateValue)
        }
    }
}
