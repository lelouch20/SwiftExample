//
//  ViewController.swift
//  ChangeFont
//
//  Created by Lelouch on 2016/12/21.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showFontLabel: UILabel!
    @IBOutlet weak var changeFontButton: UIButton!
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot"]
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFontLabel.font = UIFont(name:fontNames[0], size:20)
        
        changeFontButton.layer.cornerRadius = 55
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickChangeButton(_ sender: Any) {
        
        self.changeFont()
        
    }
    
    func changeFont() {
        
        counter = counter + 1
        showFontLabel.font = UIFont(name:fontNames[counter % 4], size:20)
        
    }

}

