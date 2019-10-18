//
//  Country.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit

class Country: UITableViewCell {
    static let cellIdentifier = String(describing: PersonalData.self)

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelCountry: UILabel!
    @IBOutlet weak var mLabelState: UILabel!
    @IBOutlet weak var mLabelCity: UILabel!
    @IBOutlet weak var mLabelPostalCode: UILabel!
    
    @IBOutlet weak var mStateButton: UIButton!
    @IBOutlet weak var mCityButton: UIButton!
    @IBOutlet weak var mPostalCodeButton: UIButton!

    override func prepareForReuse() {
        mImage.image = nil
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
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
