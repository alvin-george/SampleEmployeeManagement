//
//  UIAppViewController.swift
//  EmployeeManagement
//
//  Created by Pushpam Group on 04/05/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit
import Foundation

class UIAppViewController: UIViewController {
 

    override func viewDidLoad() {
        super.viewDidLoad()

    }
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    func hideTopNavigationBar()
    {
        self.navigationController?.isNavigationBarHidden =  true
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
