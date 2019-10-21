//
//  Map.swift
//  advanceAppIOS
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit
import MapKit



class Map: UITableViewCell {

    static let cellIdentifier = String(describing: Map.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(image: String? = nil, name: String? = nil, subtitle: String? = nil, birthdate: Date? = nil) {
    return
    }
}
