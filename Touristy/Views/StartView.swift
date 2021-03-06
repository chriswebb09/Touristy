//
//  StartView.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/14/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class StartView: UIView {
    // MARK: - Properties
    
    let welcomeLabel: UILabel! = UILabel()
    let startButton: UIButton! = UIButton()
    let settingsButton: UIButton! = UIButton()
    let titleLabel = UILabel()
    let screenHeight = UIScreen.mainScreen().bounds.height
    let screenWidth =  UIScreen.mainScreen().bounds.width
    
    // MARK: - Setup view and add subviews to view 
    
    required init?(coder: NSCoder = NSCoder.empty()) {
        super.init(coder:coder)
        self.frame = UIScreen.mainScreen().bounds
        self.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.setupButtons()
        self.addSubview(settingsButton)
        self.addSubview(startButton)
        self.setupMenu()
        self.setupConstraints()
    }
    
    // MARK: - Setup welcome label
    
    func setupMenu() {
        //self.welcomeLabel.frame = CGRectMake(40, 200, 400, 60)
        self.welcomeLabel.text = "Welcome to your historical adventure!"
        self.welcomeLabel.textColor = UIColor.blackColor()
        self.welcomeLabel.font = UIFont(name:"AppleSDGothicNeo-Regular", size:20)
        self.addSubview(self.welcomeLabel)
        
    }
    
    // MARK: - Setup start button
    
    func setupButtons() {
        //self.startButton.frame = CGRectMake(125, 350, 150, 60)
        self.startButton.layer.backgroundColor = UIColor.blueColor().CGColor
        self.startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.startButton.setTitle("Start", forState: .Normal)
    }
    
    // MARK: - Setup constraints
    
    func setupConstraints() {
        self.startButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self).dividedBy(4)
            make.center.equalTo(self)
        }
        
        self.welcomeLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).dividedBy(2)
        }
    }
    
    
    
    //    func setupConstaints() {
    //        self.startButton.snp_makeConstraints { (make) -> Void in
    //            make.center.equalTo(self)
    //        }
    //    }
    
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
