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
    
    // MARK: - Setup basic tab bar interface
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: - Instantiate view controllers that will be added to tab bar
        
        let initTab = InitialViewController()
        let startTab = StartMenuViewController()
        
        initTab.tabBarItem.title = "Initial View"
        initTab.tabBarItem.image = UIImage(named: "heart")
        startTab.tabBarItem.title = "Camera View"
        startTab.tabBarItem.image = UIImage(named: "star")
        
        let controllers = [initTab, startTab]
        
        self.viewControllers = controllers
        self.tabBar.tintColor = UIColor.whiteColor()
        self.tabBar.barTintColor = UIColor(red:0.00, green:0.49, blue:0.76, alpha:1.0)
    }
    
    // MARK: - Selected tab
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title) ?")
        return true;
    }
}

extension UITabBar {
    override public func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 71
        return sizeThatFits
    }
}