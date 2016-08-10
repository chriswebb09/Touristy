//
//  AppController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import SnapKit

class AppController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tabOne = InitialViewController()
        let tabTwo = CameraViewController()
        tabOne.tabBarItem.title = "Initial View"
        tabOne.tabBarItem.image = UIImage(named: "heart")
        tabTwo.tabBarItem.title = "Camera View"
        tabTwo.tabBarItem.image = UIImage(named: "star")
        //let iconOne = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        //item1.tabBarItem = icon1
        let controllers = [tabOne, tabTwo]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
//    let tabControl = TabBarController()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tabControl.tabBarItem
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
}

