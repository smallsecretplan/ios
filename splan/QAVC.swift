//
//  QAVC.swift
//  splan
//
//  Created by cspeng on 2016/11/23.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class QAVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden=false
   
        self.navigationItem.title=Title.menun1_title
        
         
        
    }

    override func viewWillDisappear(_ animated: Bool) {
       Common.index=0
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
