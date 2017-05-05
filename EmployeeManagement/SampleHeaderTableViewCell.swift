//
//  SampleHeaderTableViewCell.swift
//  SampleRadioButton
//
//  Created by Pushpam Group on 05/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class SampleHeaderTableViewCell: UITableViewCell {

    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        doneButton.makeRoundedCornerEdge(button: doneButton, cornerRadius: 5.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
