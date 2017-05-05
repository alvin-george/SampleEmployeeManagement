//
//  EmployeeCreationController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class EmployeeCreationController: UIAppViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var employeeCreateTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTopNavigationBar()
        
    }
    func showLacartDatePickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtDatePickerView = self.storyboard?.instantiateViewController(withIdentifier: "datePickerViewController") as! DatePickerViewController
       // lacrtDatePickerView.pickerViewItems = pickerViewItems
     lacrtDatePickerView.currentViewController = currentViewControllerIdentifier!
      //  lacrtDatePickerView.delegate =  self
        
        lacrtDatePickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtDatePickerView, animated: true, completion: nil)
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
            return 70
        case 4:
            return 40
        case 5:
            return 40
        default:
            return 100
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
            cell.titleLabel.text = "DOB"
            cell.entryTextField.placeholder = "Enter your date of birth"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextViewTableCell") as! EmployeeCreationTextViewTableCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationOptionsTableCell") as! EmployeeCreationOptionsTableCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationOptionsTableCell") as! EmployeeCreationOptionsTableCell
            cell.titleLabel.text = "Hobbies"
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

    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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
