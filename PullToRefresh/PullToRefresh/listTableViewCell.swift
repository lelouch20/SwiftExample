//
//  listTableViewCell.swift
//  PullToRefresh
//
//  Created by Lelouch on 2017/1/5.
//  Copyright © 2017年 Zero. All rights reserved.
//

import UIKit

class listTableViewCell: UITableViewCell {

    var textLab: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLab = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        textLab?.textAlignment = NSTextAlignment.center
        textLab?.font = UIFont.systemFont(ofSize: 60.0)
        self.backgroundColor = UIColor.black
        self.contentView.addSubview(textLab!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
