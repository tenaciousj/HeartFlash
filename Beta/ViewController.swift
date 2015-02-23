//
//  ViewController.swift
//  Beta
//
//  Created by Jessica Lee on 2/21/15.
//  Copyright (c) 2015 Jessica Lee. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController, YMPulseRateMeterDelegate {
    
    let captureSession = AVCaptureSession()
    var pulseRateMater : YMPulseRateMater?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    // If we find a device we'll store it here for later use
    var captureDevice : AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        pulseRateMater = YMPulseRateMater()
        pulseRateMater?.delegate = self
        
        let devices = AVCaptureDevice.devices()
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        println("Capture device found")
                        beginSession()
                    }
                }
            }
            break
        }
        
    }
    
    func focusTo(value : Float) {
        if let device = captureDevice {
            if(device.lockForConfiguration(nil)) {
                device.setFocusModeLockedWithLensPosition(value, completionHandler: { (time) -> Void in
                    //
                })
                device.unlockForConfiguration()
            }
        }
    }
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var anyTouch = touches.anyObject() as UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var anyTouch = touches.anyObject() as UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }
    
    func configureDevice() {
        /*if let device = captureDevice {
            device.lockForConfiguration(nil)
            device.focusMode = .Locked
            device.unlockForConfiguration()
        }*/
        let device = captureDevice
        device!.lockForConfiguration(nil)
        device!.focusMode = .Locked
        device!.unlockForConfiguration()
        
    }
    
    func beginSession() {
        
        configureDevice()
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer?.frame = self.view.layer.frame
        captureSession.startRunning()
    }
    
    func pulseRateMeterStartMeasureing() {
        println ("Meter is starting to measure things")
    }
    
    func completeWithPulseRate(pulseRate : Float) {
        println ("Recieved puls rate \(pulseRate)")
    }
    
    func startButtonPressed () {
        pulseRateMater?.start()
    }
}




/**
    import UIKit
    import AVFoundation

    class ViewController: UIViewController, YMPulseRateMeterDelegate {

        let captureSession = AVCaptureSession()
        var pulseRateMater : YMPulseRateMater?
        var previewLayer : AVCaptureVideoPreviewLayer?

        // If we find a device we'll store it here for later use
        var captureDevice : AVCaptureDevice?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view, typically from a nib.
            captureSession.sessionPreset = AVCaptureSessionPresetHigh
            pulseRateMater = YMPulseRateMater()
            pulseRateMater?.delegate = self
            
            let devices = AVCaptureDevice.devices()
            
            // Loop through all the capture devices on this phone
            for device in devices {
                // Make sure this particular device supports video
                if (device.hasMediaType(AVMediaTypeVideo)) {
                    // Finally check the position and confirm we've got the back camera
                    if(device.position == AVCaptureDevicePosition.Back) {
                        captureDevice = device as? AVCaptureDevice
                        if captureDevice != nil {
                            println("Capture device found")
                            beginSession()
                        }
                        else{
                            println("captureDevice is nil")
                        }
                    }
                    else{
                        println("can't find device that has position.back")
                    }
                }
                else{
                    println("can't find device that records video")
                }
            }
            
        }
        
        func focusTo(value : Float) {
            if let device = captureDevice {
                if(device.lockForConfiguration(nil)) {
                    device.setFocusModeLockedWithLensPosition(value, completionHandler: { (time) -> Void in
                        //
                    })
                    device.unlockForConfiguration()
                }
            }
        }
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
            var anyTouch = touches.anyObject() as UITouch
            var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
            focusTo(Float(touchPercent))
        }
        
        override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
            var anyTouch = touches.anyObject() as UITouch
            var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
            focusTo(Float(touchPercent))
        }
        var i = 0
        func configureDevice() {
            /*
            let devices = AVCaptureDevice.devices()
            println(devices.count)
            
            
            // Loop through all the capture devices on this phone
            for device in devices {
                // Make sure this particular device supports video
                if (device.hasMediaType(AVMediaTypeVideo)) {
                    // Finally check the position and confirm we've got the back camera
                    if(device.position == AVCaptureDevicePosition.Back) {
                        captureDevice = device as? AVCaptureDevice
                        if captureDevice != nil {
                            println("Capture device found " + String(i))
                            i++
                            beginSession()
                        }
                        else{
                            println("captureDevice is nil")
                        }
                    }
                    else{
                        println("can't find device that has position.back")
                    }
                }
                else{
                    println("can't find device that records video")
                }
            }
            
            if let device = captureDevice {
                device.lockForConfiguration(nil)
                device.focusMode = .Locked
                device.unlockForConfiguration()
            }
            
        }*/
        
        func beginSession() {
            
            configureDevice()
            
            var err : NSError? = nil
           // captureDevice = A
            var test = AVCaptureDeviceInput(device: captureDevice, error: &err)
            captureSession.addInput(test)
            
            if err != nil {
                println("error: \(err?.localizedDescription)")
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            self.view.layer.addSublayer(previewLayer)
            previewLayer?.frame = self.view.layer.frame
            captureSession.startRunning()
        }
        
        func pulseRateMeterStartMeasureing() {
            println ("Meter is starting to measure things")
        }
        
        func completeWithPulseRate(pulseRate : Float) {
            println ("Recieved pulse rate \(pulseRate)")
        }
        
        func startButtonPressed () {
            pulseRateMater?.start()
        }
}

**/

