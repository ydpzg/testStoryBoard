//
//  TestTableViewCell.swift
//  testStoryboard
//
//  Created by pcbeta on 14-10-4.
//  Copyright (c) 2014年 hgsoft. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var click: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
