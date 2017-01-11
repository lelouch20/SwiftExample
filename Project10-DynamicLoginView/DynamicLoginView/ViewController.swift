//
//  ViewController.swift
//  DynamicLoginView
//
//  Created by Lelouch on 2017/1/10.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BGWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundVideo()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
        
    }


    func loadBackgroundVideo() {
        
        let gif = ((UIApplication.shared.delegate) as! AppDelegate).gif
//        let filePath = Bundle.main.path(forResource: "video", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
        BGWebView.load(gif! as Data, mimeType: "image/gif", textEncodingName: String(), baseURL: URL.init(fileURLWithPath: String()))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

