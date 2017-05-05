//
//  RadioTableViewCell.swift
//  SampleRadioButton
//
//  Created by Pushpam Group on 05/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class RadioTableViewCell: UITableViewCell {
    
    @IBOutlet var radioCheckerImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor =  UIColor.white
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backgroundColor =  UIColor.white
    }
    
}
