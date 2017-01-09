//
//  ViewController.swift
//  RandomColorGradient
//
//  Created by Lelouch on 2017/1/5.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    var timer:Timer!
    var isPlaying:Bool!
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGradientLayer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initGradientLayer() {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        randomBackgroundColor()
        
        let color1 = UIColor.init(red: 255.0/255.0, green: 103.0/255.0, blue: 53.0/255.0, alpha: 0.7).cgColor
        let color2 = UIColor.init(red: 88.0/255.0, green: 214.0/255.0, blue: 141.0/255.0, alpha: 0.7).cgColor
        let color3 = UIColor.init(red: 0, green: 189.0/255.0, blue: 255.0/255.0, alpha: 0.7).cgColor
        
        gradientLayer.colors = [color1,color2, color3, color2, color1]
        gradientLayer.locations = [0.1, 0.3, 0.5, 0.7, 0.9]
        gradientLayer.startPoint = CGPoint(x:0.0, y:0.0)
        gradientLayer.endPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.masksToBounds = true
        gradientLayer.zPosition = -1
        self.view.layer.addSublayer(gradientLayer)
        isPlaying = false
        
    }
    
    func randomBackgroundColor() {
        
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    }
    
    

    @IBAction func onClickPlayButton(_ sender: Any) {
        
        if (isPlaying == false) {
            
            timer = Foundation.Timer.scheduledTimer(timeInterval:0.4, target: self, selector: #selector(randomBackgroundColor), userInfo: nil, repeats: true)
            isPlaying = true
            
            let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "RADWIMPS - デート2", ofType: "mp3")!)
            do {
                
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
                
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            }
            catch let audioError as NSError {
                
                print(audioError)
                
            }
            
            
        } else {
            
            audioPlayer.stop()
            timer.invalidate()
            isPlaying = false
            
        }
        
    }

}

