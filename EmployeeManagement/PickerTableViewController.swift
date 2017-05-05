//
//  PickerTableViewController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 05/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit
import Foundation

protocol UIPickerTableViewControllerDelegate {
    
    func getPickerDataFromTableView (selectedIndexes : [Int]? , selectedItems : [String]?)
}

class PickerTableViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var sampleTableView: UITableView!
    
    var pickerViewItems: [String]?
    var currentViewController : String =  String()
    var checkerButtonCurrentRow:Int =  Int()
    var checkerButtonStatus:Bool = false
    
    var selectedRows:[Int] = []
    var selectedHobbies:[String] = [""]
    
    var pickerDelegate:UIPickerTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        sampleTableView.delegate =  self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
    }
    func initialUISetup() {
        
        sampleTableView.allowsMultipleSelectionDuringEditing = true
        sampleTableView.setEditing(true, animated: false)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    //TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (pickerViewItems?.count)!
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "sampleHeaderTableViewCell") as! SampleHeaderTableViewCell
        
        headerCell.headerTitle.text =  "Choose your hobbies"
        headerCell.doneButton.addTarget(self, action: #selector(PickerTableViewController.doneButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        
        
        headerView.addSubview(headerCell)
        
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(50)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
        verticalIndicator.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioTableViewCell") as! RadioTableViewCell
        cell.tintColor = UIColor(rgb: 0x257DE6)
        cell.accessoryType = UITableViewCellAccessoryType.checkmark
        cell.titleLabel.text = pickerViewItems?[indexPath.row]
        return cell
    }
    
    //Selection check
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func doneButtonClicked(_ sender :UIButton){
        
        selectedHobbies.removeAll()
        
        //Append selected items
        if (self.sampleTableView.indexPathsForSelectedRows?.map({$0.row}) != nil)
        {
            selectedRows = (self.sampleTableView.indexPathsForSelectedRows?.map{$0.row})!
            
            for var i in (0..<selectedRows.count)
            {
                selectedHobbies.append((pickerViewItems? [(selectedRows[i])])! as String)
            }
            print("selectedHobbies : \(selectedHobbies)")
            
            //Delegate results
            DispatchQueue.main.async {
               self.pickerDelegate?.getPickerDataFromTableView(selectedIndexes: self.selectedRows, selectedItems: self.selectedHobbies)
            }
            self.dismiss(animated: true, completion: nil)
        }            
        else {
            print("Nothing selected")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
