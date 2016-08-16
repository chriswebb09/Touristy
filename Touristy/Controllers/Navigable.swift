//
//  Navigable.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/11/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
protocol Navigable {
    //implemented in protocol extension
}
extension Navigable {
    func setupNavBar() -> UINavigationBar {
        let appFonty = AppFont()
        let appController = AppController()
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, appController.view.frame.size.width, 64))
        let navItem = UINavigationItem(title: "Touristy")
        navigationBar.setItems([navItem], animated: false)
        navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:appFonty.appFontName, size:appFonty.appFontSize)!, NSForegroundColorAttributeName: UIColor.blueColor()]
        return navigationBar
    }
}

//let navItem = UINavigationItem(title: "Project Ovaltine")
//navBar.setItems([navItem], animated: false)
//navBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:appFonty.appFontName, size:appFonty.appFontSize)!, NSForegroundColorAttributeName: UIColor.blueColor()]