//
//  CameraViewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var headsUpDisplay = Camera()
    
    //var founderImage: UIImageView! = UIImageView()
    var augmentedImage: UIImageView! = UIImageView()
    var recordButton: UIButton! = RecordButton().setup()
    var cancelButton: UIButton! = CancelButton().setup()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview =  AVCaptureVideoPreviewLayer(session: self.headsUpDisplay.cameraSession)
        preview.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        preview.position = CGPoint(x: CGRectGetMidX(self.view.bounds), y: CGRectGetMidY(self.view.bounds))
        preview.videoGravity = AVLayerVideoGravityResize
        return preview
    }()
    
    lazy var cameraSession: AVCaptureSession = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetLow
        return session
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
    
    func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func activateAtLocation() {
        
    }
    
}


