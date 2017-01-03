//
//  ViewController.swift
//  SlideViewDemo
//
//  Created by Lelouch on 2016/12/26.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initScrollView()
        UIApplication.shared.isStatusBarHidden = true
    }

    func initScrollView() {
        
        scrollView.delegate = self
        let rect = CGRect(x:0, y:0, width:ScreenWidth, height:ScreenHeight)
        scrollView.frame = rect
        let size = CGSize(width:ScreenWidth * 3, height:ScreenHeight)
        scrollView.contentSize = size
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        self.addLeftView()
        self.addCmeraView()
        self.addRightView()
        
        self.view.addSubview(scrollView)
    }
    
    func addCmeraView() {
        
        let cameraVC = CameraViewController()
        let cameraView = cameraVC.view
        let rect = CGRect(x:ScreenWidth, y:0, width:ScreenWidth, height:ScreenHeight)
        cameraView?.frame = rect
        
        self.addChildViewController(cameraVC)
        
        self.scrollView.addSubview(cameraView!)
        
        
    }
    
    func addLeftView(){
        
        let leftVC = self.storyboard?.instantiateViewController(withIdentifier:"leftVC")
        let leftView = leftVC?.view
        let rect = CGRect(x:0, y:0, width:ScreenWidth, height:ScreenHeight)
        leftView?.frame = rect
        
        self.addChildViewController(leftVC!)
        scrollView.addSubview(leftView!)
        
    }
    
    func addRightView() {
        
        let rigthVC = self.storyboard?.instantiateViewController(withIdentifier:"rightVC")
        let rightView = rigthVC?.view
        let rect = CGRect(x:ScreenWidth * 2, y:0, width:ScreenWidth, height:ScreenHeight)
        rightView?.frame = rect
        
        self.addChildViewController(rigthVC!)
        scrollView.addSubview(rightView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

