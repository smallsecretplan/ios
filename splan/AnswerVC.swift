//
//  AnswerVC.swift
//  splan
//
//  Created by cspeng on 2016/12/3.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class AnswerVC: UIViewController {

    
    @IBOutlet weak var  Close :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func CloseVC(sender : AnyObject){
    
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    
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
