//
//  OnlineVC.swift
//  splan
//
//  Created by cspeng on 2016/12/4.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class OnlineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title=Title.menun5_title
        self.navigationController?.navigationBar.isHidden=false
        let backItem = UIBarButtonItem()
        backItem.title = ""
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
