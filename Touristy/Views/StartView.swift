//
//  StartView.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/14/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class StartView: UIView {
    let startButton: UIButton! = UIButton()
    let settingsButton: UIButton! = UIButton()
    var navigationBar = NavBar().setup()
    required init?(coder: NSCoder = NSCoder.empty()) {
        super.init(coder:coder)
        self.addSubview(navigationBar)
        self.addSubview(settingsButton)
        self.addSubview(startButton)
    }
    
}
