//
//  TabBarController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
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
        let controllers = [tabOne, tabTwo]
        self.viewControllers = controllers
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title) ?")
        return true;
    }
    
    //let iconOne = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
    //item1.tabBarItem = icon1
}