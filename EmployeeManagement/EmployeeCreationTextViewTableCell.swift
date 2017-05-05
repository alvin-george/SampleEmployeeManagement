//
//  EmployeeCreationTextViewTableCell.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class EmployeeCreationTextViewTableCell: UITableViewCell {
    
    @IBOutlet var addressTextView: UITextView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Custom setter so we can initialize the height of the text view
    var textString: String {
        get {
            return addressTextView?.text ?? ""
        }
        set {
            if let textView = addressTextView {
                textView.text = newValue
                textView.delegate?.textViewDidChange?(textView)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Disable scrolling inside the text view so we enlarge to fitted size
        addressTextView?.isScrollEnabled = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            addressTextView?.becomeFirstResponder()
        } else {
            addressTextView?.resignFirstResponder()
        }
    }
}
