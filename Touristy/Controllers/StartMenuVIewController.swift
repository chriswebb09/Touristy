//
//  StartMenuVIewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/14/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class StartMenuViewController: UIViewController, Navigable {
    var startButton: UIButton! = StartTourButton().setup()
    let currentView = StartView()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.view.addSubview(self.currentView!)
        self.view.addSubview(self.setupNavBar())
        self.currentView?.startButton.addTarget(self, action: #selector(startButtonTapped), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startButtonTapped() {
        let nextVC = TabBarController()
        self.presentViewController(nextVC, animated: true, completion: nil)
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
