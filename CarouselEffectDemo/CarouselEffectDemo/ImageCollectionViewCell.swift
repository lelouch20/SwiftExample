//
//  ImageCollectionViewCell.swift
//  CarouselEffectDemo
//
//  Created by Lelouch on 2017/1/3.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

struct imageInfo {
    
    let image: String
    let title: String
    
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
}
