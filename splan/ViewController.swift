//
//  ViewController.swift
//  splan
//
//  Created by cspeng on 2016/11/19.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    let  itemdata = ["自我評估量表", "行動方案", "好友幫我","專欄文章","線上專家諮詢","政府資源"]
    
    let  imgdata = ["btn01", "btn02", "btn03","btn04","btn05","btn06"]
    
    let width = UIScreen.main.bounds.size.width
    @IBOutlet weak var colltionView : UICollectionView?
    @IBOutlet weak var imageview : UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nav = self.navigationController?.navigationBar

        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    
        nav?.barTintColor=Common.CommonColor
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
           navigationItem.backBarButtonItem = backItem
        
    
       let layout = UICollectionViewFlowLayout()
//        colltionView = UICollectionView(frame: CGRect(x:0, y:0, width:width, height:width), collectionViewLayout: layout)
   
        
        

        
    
          colltionView?.backgroundView?.backgroundColor=UIColor.blue
        
        layout.itemSize = CGSize(width:(width-10)/2, height:(width-10)/2)
        
        layout.minimumInteritemSpacing=0
        layout.minimumLineSpacing=0
  
        self.colltionView?.setCollectionViewLayout(layout, animated: true)
        
    
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
      self.navigationController?.navigationBar.isHidden=true
    }
// MARK: - UICollectionView protocol
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return  itemdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
      let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)as! ItemCell
        
        cell.icon.image = UIImage(named:imgdata[indexPath .row])

        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if(indexPath.row==0){
            self.QAVC()
        }
        
        if(indexPath.row==1){
            self.ActionVC()
        }
        if(indexPath.row==2){
            self.HelpVC()
        }
        
        if(indexPath.row==3){
            self.ArticleVC()
        }
        if(indexPath.row==4){
            self.TalkVC()
        }
        
        if(indexPath.row==5){
            self.GovVC()
        }
        
        
    }
   

    func collectionView(_collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        
        let cellSize:CGSize = CGSize(width:self.colltionView!.frame.width/2, height:self.colltionView!.frame.width/2)
        return cellSize
    }
    
    
    func TalkVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "OnlineVC")
        self.navigationController?.pushViewController(target, animated:true)
    
    }
    
    func QAVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "QAVC")
        self.navigationController?.pushViewController(target, animated:true)
        
    }
    
    func ActionVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "ActionVC")
        self.navigationController?.pushViewController(target, animated:true)
        
    }
    
    
    func HelpVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "HelpVC")
        self.navigationController?.pushViewController(target, animated:true)
        
    }
    
    func ArticleVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "ArticleVC")
        self.navigationController?.pushViewController(target, animated:true)
        
    }
    
    
    func GovVC()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "GovVC")
        self.navigationController?.pushViewController(target, animated:true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

