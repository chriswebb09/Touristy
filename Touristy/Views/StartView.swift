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
    let titleLabel = UILabel()
    let screenHeight = UIScreen.mainScreen().bounds.height
    let screenWidth =  UIScreen.mainScreen().bounds.width
    // = UIScreen.mainScreen().bounds
    
    required init?(coder: NSCoder = NSCoder.empty()) {
        super.init(coder:coder)
        self.frame = UIScreen.mainScreen().bounds
        self.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.setupButtons()
        self.addSubview(navigationBar)
        self.addSubview(settingsButton)
        self.addSubview(startButton)
        self.setupConstaints()
    }
    
    func setupMenu() {
        
    }
    
    func setupButtons() {
        self.startButton.frame = CGRectMake(0, 0, 60, 45)
        self.startButton.layer.backgroundColor = UIColor.blueColor().CGColor
        self.startButton.titleLabel!.text = "Start"
        self.startButton.titleLabel?.textColor = UIColor.whiteColor()
    }
    
    func setupConstaints() {
        self.startButton.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
    }
    
//    func setupView() {
//        self.graphView.snp_makeConstraints { (make) -> Void in
//            make.size.equalTo(140)
//            
//            make.center.equalTo(self)
//            make.left.equalTo(self).offset(20)
//        }
//        self.locationNameLabel.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(self).offset(95)
//            make.left.equalTo(self).offset(130)
//            
//        }
//}
}
