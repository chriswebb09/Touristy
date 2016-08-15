//
//  NSCoderExtension.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/15/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

//

import UIKit
extension NSCoder {
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWithData: data)
    }
}

