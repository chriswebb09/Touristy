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
    // MARK: - Properties
    var headsUpDisplay = Camera()
    var founderImage: UIImageView! = UIImageView()
    var augmentedImage: UIImageView! = UIImageView()
    
    var cancelButton: UIButton! = UIButton()
    
    //MARK: - Computed lazy var for camera preview layer
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview =  AVCaptureVideoPreviewLayer(session: self.headsUpDisplay.cameraSession)
        preview.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        preview.position = CGPoint(x: CGRectGetMidX(self.view.bounds), y: CGRectGetMidY(self.view.bounds))
        preview.videoGravity = AVLayerVideoGravityResize
        return preview
    }()
    
    // MARK: - Loaded View
    override func viewDidLoad() {
        self.headsUpDisplay.setupCameraSession()
    }
    
    // MARK: - viewDidAppear added previewLayer, cancelButton, augmentedImage to view and startup camera
    
    override func viewDidAppear(animated: Bool) {
        view.layer.addSublayer(previewLayer)
        headsUpDisplay.cameraSession.startRunning()
        view.bringSubviewToFront(cancelButton)
        view.bringSubviewToFront(augmentedImage)
    }
    
    // MARK: - Computed lazy var for camera session
    
    lazy var cameraSession: AVCaptureSession = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetLow
        return session
    }()
    
    // MARK: - Implement cancel button functionality
    
    func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

