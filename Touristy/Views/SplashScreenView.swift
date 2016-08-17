//
//  SplashScreenView.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/17/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class SplashScreenView: UIView {
    var titleLabel: UILabel! = UILabel()
    
    required init?(coder: NSCoder = NSCoder.empty()) {
        super.init(coder: coder)
        self.setupLabels()
    }
    
    func setupLabels() {
        self.titleLabel.frame = CGRectMake(40, 200, 400, 60)
        self.titleLabel.text = "Froleeyo"
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.font = UIFont(name:"AppleSDGothicNeo-Regular", size:20)
        self.addSubview(self.titleLabel)
    }
    
    
}
