//
//  ViewController.swift
//  Project09-ImageScroller
//
//  Created by Lelouch on 2017/1/10.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView:UIScrollView!
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image:UIImage(named:"Image"))
        setUpScrollView()
        scrollView.delegate = self
        setZoomScaleFor(srollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        recenterImage()
        
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(srollViewSize: scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            
            scrollView.zoomScale = scrollView.minimumZoomScale
            
        }
        
        recenterImage()
        
    }
    
    private func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    private func setZoomScaleFor(srollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
        
    }
    
    private func setUpScrollView() {
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.imageView
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        self.recenterImage()
        
    }
    
    


}
