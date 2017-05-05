//
//  EmployeeCreationController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class EmployeeCreationController: UIAppViewController,UITableViewDataSource, UITableViewDelegate,UITextViewDelegate, UIPickerControllerDataDelegate, UIPickerTableViewControllerDelegate, UIDatePickerControllerDelegate {
    
    @IBOutlet var employeeCreateTableView: UITableView!
    
    var selectedItemOnGender:String = ""
    var selectedItemsOnHobbies:[String] = []
    var selectedDateOfBirth:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTopNavigationBar()
        initialUISetUp()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetUp()
    }
    func initialUISetUp()
    {
        self.automaticallyAdjustsScrollViewInsets = false
        self.employeeCreateTableView.rowHeight = UITableViewAutomaticDimension
    }
    //Custom UI Elements Calls
    func showLacartDatePickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtDatePickerView = self.storyboard?.instantiateViewController(withIdentifier: "datePickerViewController") as! DatePickerViewController
        lacrtDatePickerView.currentViewController = currentViewControllerIdentifier!
        lacrtDatePickerView.delegate =  self
        
        lacrtDatePickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtDatePickerView, animated: true, completion: nil)
    }
    func showLacartPickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtPickerView = self.storyboard?.instantiateViewController(withIdentifier: "pickerViewController") as! PickerViewController
        lacrtPickerView.pickerViewItems = pickerViewItems
        lacrtPickerView.currentViewController = currentViewControllerIdentifier!
        lacrtPickerView.delegate =  self
        
        lacrtPickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtPickerView, animated: true, completion: nil)
    }
    func showLacartPickerTableView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacartPickerTableView = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifier.Picker_TableView.rawValue) as! PickerTableViewController
        
        lacartPickerTableView.pickerViewItems = pickerViewItems
        lacartPickerTableView.currentViewController = currentViewControllerIdentifier!
        lacartPickerTableView.pickerDelegate =  self
        
        lacartPickerTableView.modalPresentationStyle = .overCurrentContext
        self.present(lacartPickerTableView, animated: true, completion: nil)
    }
    
    //employeeCreateTableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 70
        case 2:
            return 70
        case 3:
            return UITableViewAutomaticDimension
        case 4:
            return 40
        case 5:
            return 40
        default:
            return UITableViewAutomaticDimension
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationProfileTableCell") as! EmployeeCreationProfileTableCell
            cell.nameTextField.tag =  indexPath.section
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextFieldTableCell") as! EmployeeCreationTextFieldTableCell
            cell.entryTextField.tag =  indexPath.section
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextFieldTableCell") as! EmployeeCreationTextFieldTableCell
            cell.entryTextField.tag =  indexPath.section
            
            if (selectedDateOfBirth != nil)
            {
                cell.entryTextField.text =  selectedDateOfBirth
            }
            cell.titleLabel.text = "DOB"
            cell.entryTextField.placeholder = "Enter your date of birth"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextViewTableCell") as! EmployeeCreationTextViewTableCell
            cell.addressTextView.delegate =  self
            cell.addressTextView.tag =  indexPath.section
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationOptionsTableCell") as! EmployeeCreationOptionsTableCell
            cell.titleLabel.text = "Gender"
            
            if (selectedItemOnGender.isEmpty)
            {
                cell.selectedOptionLabel.text = "Choose"
                
            }
            else {
                cell.selectedOptionLabel.text = selectedItemOnGender
            }
            cell.optionsButton.tag = indexPath.section
            cell.optionsButton.addTarget(self, action: #selector(EmployeeCreationController.optionsButtonClicked(_:)), for: UIControlEvents.touchUpInside)
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationOptionsTableCell") as! EmployeeCreationOptionsTableCell
            cell.titleLabel.text = "Hobbies"
            
            if (selectedItemsOnHobbies.isEmpty)
            {
                cell.selectedOptionLabel.text = "Choose"
                
            }
            else {
                cell.selectedOptionLabel.text = String(selectedItemsOnHobbies.count)+" Hobbies Added"
            }
            cell.optionsButton.tag = indexPath.section
            cell.optionsButton.addTarget(self, action: #selector(EmployeeCreationController.optionsButtonClicked(_:)), for: UIControlEvents.touchUpInside)
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
    }
    
    //TextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            textField.resignFirstResponder()
            showLacartDatePickerView(currentViewControllerIdentifier: "", pickerViewItems: [""])
            break
        default:
            break
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print(textField.tag)
        textField.resignFirstResponder();
        return true;
    }
    
    //UITextView Delegates
    func textViewDidBeginEditing(_ textView: UITextView){
        
    }
    func textViewDidEndEditing(_ textView: UITextView){
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{        
        
        switch textView.tag {
        case 4:
            print(textView.text)
        default:
            break;
        }
        
        return true
    }
    
    
    
    //UIPickerControllerDataDelegate - Custom
    func getPickerData(selectedIndex : Int, selectedItem : String?){
        
        selectedItemOnGender = selectedItem! as String
        self.employeeCreateTableView.reloadData()
        
    }
    //UIPickerTableViewControllerDelegate - Custom
    func getPickerDataFromTableView(selectedIndexes: [Int]?, selectedItems: [String]?) {
        
        selectedItemsOnHobbies = selectedItems!
        self.employeeCreateTableView.reloadData()
    }
    //UIDatePickerControllerDelegate- Custom
    func getDatePickerData(selectedDate: String?) {
        
        self.view.endEditing(true)
        selectedDateOfBirth =  selectedDate!
        self.employeeCreateTableView.reloadData()
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func optionsButtonClicked(_ sender: UIButton) {
        
        print(sender.tag)
        
        switch sender.tag {
        case 4:
            showLacartPickerView(currentViewControllerIdentifier: ViewControllerIdentifier.Employee_Creation.rawValue, pickerViewItems: ["Male", "Female","Other"])
        case 5:
            showLacartPickerTableView(currentViewControllerIdentifier: ViewControllerIdentifier.Picker_TableView.rawValue, pickerViewItems: ["Cricket","Football","Coding","Reading","Music","Watching Movies","Swimming","Gardening","Traveling"])
        default:
            break;
        }
        
    }
    @IBAction func submitButtonClicked(_ sender: Any) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
