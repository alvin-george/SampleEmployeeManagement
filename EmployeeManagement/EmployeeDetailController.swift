//
//  EmployeeDetailController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class EmployeeDetailController: UIAppViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var employeeDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           hideTopNavigationBar()
        
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
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextFieldTableCell") as! EmployeeCreationTextFieldTableCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCreationTextFieldTableCell") as! EmployeeCreationTextFieldTableCell
            cell.titleLabel.text = "DOB"
            
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
    @IBAction func editButtonClicked(_ sender: Any) {
        
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
