//
//  EmployeeListController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class EmployeeListController: UIAppViewController ,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIPickerControllerDataDelegate {
    
    @IBOutlet var employeeListTableView: UITableView!
    @IBOutlet var employeeSearchBar: UISearchBar!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var addEmployeeButton: UIButton!
    @IBOutlet var addEmployeeButtonImage: UIImageView!
    @IBOutlet var searchButtonImage: UIImageView!
    
    
    @IBOutlet var sortTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideTopNavigationBar()
        initialUISetup()        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
    }
    func initialUISetup()
    {
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.employeeSearchBar.isHidden =  true
        self.employeeSearchBar.setPlaceholderTextColor(color: UIColor.white)
        self.employeeSearchBar.changeSearchImage(searchBar: employeeSearchBar, imageName: "search_white_icon")
        self.employeeSearchBar.textColor =  UIColor.white
    }
    func showSearchBar()
    {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .transitionCrossDissolve, animations: {
            
            self.employeeSearchBar.isHidden =  false
            self.titleLabel.isHidden =  true
            self.searchButton.isHidden =  true
            self.addEmployeeButton.isHidden =  true
            self.addEmployeeButtonImage.isHidden =  true
            self.searchButtonImage.isHidden = true
        })
    }
    func hideSearchBar()
    {
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .transitionCrossDissolve, animations: {
            self.employeeSearchBar.isHidden =  true
            self.titleLabel.isHidden =  false
            self.searchButton.isHidden =  false
            self.addEmployeeButton.isHidden =  false
            self.addEmployeeButtonImage.isHidden =  false
            self.searchButtonImage.isHidden = false
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //employeeListTableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeListTableCell") as! EmployeeListTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        
        self.performSegue(withIdentifier: "segueToEmployeeDetailController", sender: self)
        
    }
    // employeeSearchBar Delegates
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.employeeSearchBar.endEditing(true)
        hideSearchBar()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.employeeSearchBar.resignFirstResponder()
        self.hideSearchBar()
    }
    
    @IBAction func addEmployeeButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToEmployeeCreationController", sender: self)
    }
    @IBAction func employeeSearchButtonClicked(_ sender: Any) {
        showSearchBar()
    }
    @IBAction func sortButtonClicked(_ sender: Any) {
        
        showLacartPickerView(currentViewControllerIdentifier: "employeeListController", pickerViewItems: ["Added Date", "Name", "Designation", "DOB"])
        
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
    //UIPickerControllerDataDelegate - Custom
    func getPickerData(selectedIndex : Int, selectedItem : String?){
        sortTitleLabel.text = "Sort by: "+selectedItem!
        
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
