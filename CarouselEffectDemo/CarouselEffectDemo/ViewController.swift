//
//  ViewController.swift
//  CarouselEffectDemo
//
//  Created by Lelouch on 2017/1/3.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    var data = [
        
        imageInfo(image: "bodyLine", title: "Training like this, #bodyline"),
        imageInfo(image: "cuteGirl", title: "Hello there, i miss u."),
        imageInfo(image: "jogging", title: "Seals Documentary"),
        imageInfo(image: "lightSword", title: "Dark Varder, #emoji"),
        imageInfo(image: "man", title: "I have no idea, bitch"),
        imageInfo(image: "sea", title: "I'm hungry, indeed."),
        imageInfo(image: "seaAnimal", title: "🐳🐳🐳🐳🐳")
        
    ]
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    //返回多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    //返回自定义的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell

        
        let imageInfo = data[indexPath.row]
        cell.cellImage.image = UIImage(named:imageInfo.image)
        cell.cellLabel.text = imageInfo.title
        
        return cell
        
    }
    
    //返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }


}

