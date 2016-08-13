//
//  Camera.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import AVFoundation

class Camera: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    //let cameraSession = AVCaptureSession()
    let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) as AVCaptureDevice
    
    lazy var cameraSession: AVCaptureSession = {
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetLow
        return session
    }()
    
    func setupCameraSession() {
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo) as AVCaptureDevice
        
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            self.cameraSession.beginConfiguration()
            
            if (self.cameraSession.canAddInput(deviceInput) == true) {
                self.cameraSession.addInput(deviceInput)
            }
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(unsignedInt: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if (self.cameraSession.canAddOutput(dataOutput) == true) {
                self.cameraSession.addOutput(dataOutput)
            }
            
            self.cameraSession.commitConfiguration()
            
            let queue = dispatch_queue_create("com.invasivecode.videoQueue", DISPATCH_QUEUE_SERIAL)
            dataOutput.setSampleBufferDelegate(self, queue: queue)
            
        }
        catch let error as NSError {
            NSLog("\(error), \(error.localizedDescription)")
        }
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
    }
}
