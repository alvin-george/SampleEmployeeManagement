//
//  AppExtensions.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import Foundation
import UIKit


extension UISearchBar{
    
    var textColor:UIColor? {
        get {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                return textField.textColor
            } else {
                return nil
            }
        }
        
        set (newValue) {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                textField.textColor = newValue
            }
        }
    }
    private func getViewElement<T>(type: T.Type) -> T? {
        
        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
    func makeTransparentBackground(searchBar :UISearchBar?)-> UISearchBar {
        searchBar?.isTranslucent = true
        searchBar?.alpha = 1
        searchBar?.backgroundImage = UIImage()
        searchBar?.barTintColor = UIColor.clear
        return searchBar!
    }
    func getSearchBarTextField() -> UITextField? {
        
        return getViewElement(type: UITextField.self)
    }
    func setPlaceholderTextColor(color: UIColor) {
        if let textField = getSearchBarTextField() {
            textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSForegroundColorAttributeName: color])
        }
    }
    func makeBoarder(searchBar :UISearchBar?,cornerRadius : CGFloat?) -> UISearchBar   {
        
        searchBar?.layer.borderWidth = 1
        searchBar?.layer.borderColor = UIColor.white.cgColor
        searchBar?.layer.cornerRadius =  cornerRadius!
        return searchBar!
    }
    func changeSearchImage (searchBar :UISearchBar?,imageName : String? ){
        searchBar?.setImage(UIImage(named: imageName!), for: .search, state: .normal)
    }
}
extension UIImageView {
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIViewContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.image = anyImage
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UIButton {
    
    func makeRoundedCornerEdge(button:UIButton, cornerRadius : CGFloat)
    {
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.layer.borderColor = button.backgroundColor?.cgColor
    }
    
}
extension Date{
    
    func convertToString(date:Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let intialDateString = formatter.string(from: date)
        let givenDate = formatter.date(from: intialDateString)
    
        formatter.dateFormat = "dd-MMM-yyyy"
        let finalDateString = formatter.string(from: givenDate!)
        
        return finalDateString
    }
}
