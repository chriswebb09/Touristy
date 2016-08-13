//
//  CameraView.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/13/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIViewController {
    var headsUpDisplay = Camera()
    var founderImage: UIImageView! = UIImageView()
    var augmentedImage: UIImageView! = UIImageView()
    
    var cancelButton: UIButton! = UIButton()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview =  AVCaptureVideoPreviewLayer(session: self.headsUpDisplay.cameraSession)
        preview.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        preview.position = CGPoint(x: CGRectGetMidX(self.view.bounds), y: CGRectGetMidY(self.view.bounds))
        preview.videoGravity = AVLayerVideoGravityResize
        return preview
    }()
    
    override func viewDidLoad() {
        self.headsUpDisplay.setupCameraSession()
    }
    
    override func viewDidAppear(animated: Bool) {
        view.layer.addSublayer(previewLayer)
        headsUpDisplay.cameraSession.startRunning()
        view.bringSubviewToFront(cancelButton)
        view.bringSubviewToFront(augmentedImage)
    }
    
    lazy var cameraSession: AVCaptureSession = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetLow
        return session
    }()
    
    func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

