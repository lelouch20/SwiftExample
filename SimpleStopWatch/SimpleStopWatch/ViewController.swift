//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Lelouch on 2016/12/21.
//  Copyright © 2016年 Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = Foundation.Timer()
    let originValue = 0.0
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickResetButton(_ sender: Any) {
        
        timer.invalidate()
        counter = 0.0
        countLabel.text = String(originValue)
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
    }

    @IBAction func onClickStartButton(_ sender: Any) {
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(self.updateCounterLabel) , userInfo: nil, repeats: true)

    }
    
    
    @IBAction func onClickPauserButton(_ sender: Any) {
        
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        
    }
    
    func updateCounterLabel() {
        
        counter = counter + 0.1
        countLabel.text = String(format:"%.1f", counter)
        
    }
}

