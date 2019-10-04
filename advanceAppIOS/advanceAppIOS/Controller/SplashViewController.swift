//
//  SplashViewController.swift
//  advanceAppIOS
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 kolbStudio. All rights reserved.
//

import UIKit
import Lottie


class SplashViewController: UIViewController {
    
    @IBOutlet weak var mViewLoading: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAnimation()
        navigate()
    }
        
    func playAnimation() {
        let animationView = AnimationView (name: "lottie_ripple")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.frame = mViewLoading.bounds
        mViewLoading.addSubview(animationView)
        animationView.play()
    }

    
    
    
    
    private func navigate() {
        
        
              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                  let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                  
                  guard let viewCotroller = storyboard.instantiateInitialViewController() else {
                      return
                  }
                  
                  self.present(viewCotroller, animated: true)
    }




}
}
