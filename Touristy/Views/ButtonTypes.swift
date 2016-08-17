//
//  ButtonTypes.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/13/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

struct RecordButton {
    var recordButton = UIButton()
    
    func setup() -> UIButton {
        self.recordButton.frame = CGRect(x: 200, y: 200, width: 90, height: 90)
        self.recordButton.layer.backgroundColor = UIColor.redColor().CGColor
        return self.recordButton
    }
}


struct CancelButton {
    var cancelButton = UIButton()
    
    func setup() -> UIButton {
        self.cancelButton.frame = CGRect(x: 200, y: 200, width: 90, height: 90)
        self.cancelButton.layer.backgroundColor = UIColor.redColor().CGColor
        return self.cancelButton
    }
}


struct StartTourButton {
    var startTourButton = UIButton()
    
    func setup() -> UIButton {
        self.startTourButton.frame = CGRect(x: 200, y: 200, width: 180, height: 90)
        self.startTourButton.layer.backgroundColor = UIColor.blueColor().CGColor
        return self.startTourButton
    }
}

