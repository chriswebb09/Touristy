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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        //self.view = StartView()
       self.view.addSubview(StartView()!)
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
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
