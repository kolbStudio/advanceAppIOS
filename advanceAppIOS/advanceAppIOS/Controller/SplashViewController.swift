//
//  SplashViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit


class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            
            guard let viewCotroller = storyboard.instantiateInitialViewController() else {
                return
            }
            
            self.present(viewCotroller, animated: true)
        }
    }

}
