//
//  GovVC.swift
//  splan
//
//  Created by cspeng on 2016/12/4.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class GovVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var table : UITableView?
    
    
    

    let  govlist = ["113婦女保護專線", "家庭暴力防治網", "自殺防治安心專線","張老師專線","生命線","勵馨基金會"]
    
    let  govurl = ["113", "http://www.tapdv.tw/", "0800788955","1980","1995","https://www.goh.org.tw/tc/index.asp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title=Title.menun6_title
        self.navigationController?.navigationBar.isHidden=false
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return govlist.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = govlist[indexPath.row]
        
        cell.textLabel?.textColor=Common.CommonTextColor
        
        
        return cell
    }
  
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if(indexPath.row==1||indexPath.row==5){
        
            UIApplication.shared.openURL(URL(string: govurl[indexPath.row])!)
            
        }else{
        
            if let url = NSURL(string: "tel://\(govurl[indexPath.row])"), UIApplication.shared.canOpenURL(url as URL) {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
