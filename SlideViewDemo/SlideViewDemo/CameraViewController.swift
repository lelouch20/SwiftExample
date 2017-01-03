//
//  CameraViewController.swift
//  SlideViewDemo
//
//  Created by Lelouch on 2017/1/3.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit
import AVFoundation


class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    let session = AVCaptureSession()
    var layer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        self.setupCamera()
    }
    
    func setupCamera() {
        
        self.session.sessionPreset = AVCaptureSessionPresetHigh
        var input = AVCaptureDeviceInput()
        do {
            
            input = try AVCaptureDeviceInput(device: device)
            
        } catch {
            
           //error
            
        }
        
        let output = AVCaptureMetadataOutput()
        //设置响应区域
        output.rectOfInterest = CGRect(x:0, y:0, width:0, height:0)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        if session.canAddInput(input) {
            
            session.addInput(input)
            
        }
        if session.canAddOutput(output) {
            
            session.addOutput(output)
            
        }
        
        
        layer = AVCaptureVideoPreviewLayer(session: session)
        layer!.videoGravity = AVLayerVideoGravityResizeAspectFill
        layer!.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        self.view.layer.insertSublayer(self.layer!, at: 0)
        
        session.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        if self.session.isRunning {
            
            self.session.stopRunning()
            
        }
        
    }

}
