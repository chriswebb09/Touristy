//
//  Tabable.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/11/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
protocol Tabable: UITabBarControllerDelegate {
    //implemeneted in protocol extension
}
extension Tabable {
    var initialViewController : InitialViewController { return InitialViewController() }
    var cameraViewController: CameraViewController { return CameraViewController() }    
}
