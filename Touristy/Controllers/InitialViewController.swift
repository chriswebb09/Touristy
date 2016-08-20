//
//  InitialViewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import SnapKit

class InitialViewController: UIViewController, Navigable {
    
    var VCTitleLabel: UILabel! = UILabel() {
        didSet {
            self.VCTitleLabel.frame = CGRectMake(90, 300, 300, 80)
            self.VCTitleLabel.text = "InitialViewController Loaded!"
            self.VCTitleLabel.textColor = UIColor.whiteColor()
            self.VCTitleLabel.font = UIFont(name:"AppleSDGothicNeo-Regular", size:20)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.view.addSubview(self.setupNavBar())
        self.setupLabels()
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLabels() {
        
        self.view.addSubview(self.VCTitleLabel)
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
