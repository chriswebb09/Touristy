//
//  StartMenuVIewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/14/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class StartMenuViewController: UIViewController {
    var startButton: UIButton! = StartTourButton().setup()
    let currentView = StartView()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
      
        //self.view = StartView()
       self.view.addSubview(self.currentView!)
        self.currentView?.startButton.addTarget(self, action: #selector(startButtonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        //self.view.backgroundColor = UIColor.grayColor()
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
        let nextVC = MapKitViewController()
        self.presentViewController(nextVC, animated: true, completion: nil)
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
