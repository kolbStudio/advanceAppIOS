//
//  PersonViewCell.swift
//  advanceAppIOS
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

class PersonViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: PersonViewCell.self)

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    func configureCell(image: String? = nil, name: String? = nil, email: String? = nil) {
        mImage.image = UIImage(named: image ?? "")
        mLabelName.text = name
        mLabelEmail.text = email
    }
}
