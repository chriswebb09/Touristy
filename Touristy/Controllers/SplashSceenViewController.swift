//
//  SplashSceenViewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/17/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    let splashView = SplashScreenView()
    
    override func viewDidLoad() {
        self.view.addSubview(splashView!)
    }
}
