//
//  ViewController.swift
//  PlayVideo
//
//  Created by Lelouch on 2016/12/22.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoList: UITableView!
    var playerView = AVPlayer()
    var playerVC = AVPlayerViewController()
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onClickPlayButton(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playerVC.player = playerView
        
        self.present(playerVC, animated: true) {
            self.playerVC.player?.play()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let identifier = "videoCell"
        let cell = videoList.dequeueReusableCell(withIdentifier:identifier, for:indexPath) as! videoTableViewCell
        
        let video = data[indexPath.row]
        cell.videoImageView.image = UIImage(named:video.image)
        cell.viedoTitleLabel.text = video.title
        cell.videoSecondTitleLabel.text = video.source
        
        return cell
        
        
    }

}

