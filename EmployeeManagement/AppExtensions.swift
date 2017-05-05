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
