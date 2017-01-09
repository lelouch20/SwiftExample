//
//  viedoTableViewCell.swift
//  PlayVideo
//
//  Created by Lelouch on 2016/12/22.
//  Copyright © 2016 Zero. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class videoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var viedoTitleLabel: UILabel!
    @IBOutlet weak var videoSecondTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
