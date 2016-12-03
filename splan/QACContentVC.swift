//
//  QACContentVC.swift
//  splan
//
//  Created by cspeng on 2016/12/3.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class QACContentVC: UIViewController {


    
        @IBOutlet weak var  message :UILabel!
        @IBOutlet weak var  Ybtn :UIButton!
        @IBOutlet weak var  Nbtn :UIButton!
        @IBOutlet weak var  Progress: UIProgressView!
        @IBOutlet weak var  ProgressContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.navigationItem.title=Title.menun1_title
      
        let newBackButton = UIBarButtonItem(title:"", style:.plain, target: self, action: #selector(QACContentVC.Back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
         message.text = Common.data[Common.index]
        
        
        let ratio = Float(Common.index+1)/Float(Common.total)
    
        Progress.progress = Float(ratio)
  
        ProgressContent.text = "\(Common.index+1)/\(Common.total)"
     
  
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        if(Common.data_status[Common.index]=="Y"){
            
            
            Ybtn.imageView?.alpha=0.5
            
            
        }
        
        if(Common.data_status[Common.index]=="N"){
            
            Nbtn.imageView?.alpha=0.5
            
        }
    }
    @IBAction func Ystatus(sender : AnyObject){
        
        
        Common.data_status[Common.index]="Y"
        Common.index+=1
      
       self.CheckSattus()
    }
    
    @IBAction func Nstatus(sender : AnyObject){
        
        Common.data_status[Common.index]="N"
        Common.index+=1
           self.CheckSattus()
        
    }

    func Back(sender : AnyObject){
       
      Common.index-=1
        self.navigationController?.popViewController(animated: true)
    }
    
    func CheckSattus()
    {
        
        //message.text=Common.data[Common.index]
        if(Common.index==10){
           
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let target = storyboard.instantiateViewController(withIdentifier: "AnswerVC")
            self.navigationController?.pushViewController(target, animated:true)
            
        }else{
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let target = storyboard.instantiateViewController(withIdentifier: "QACContentVC")
            self.navigationController?.pushViewController(target, animated:true)
        }
        
        
        
        
    
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
