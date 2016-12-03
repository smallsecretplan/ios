//
//  ItemCell.swift
//  splan
//
//  Created by cspeng on 2016/11/23.
//  Copyright © 2016年 shan. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    
   let width = UIScreen.main.bounds.size.width
    @IBOutlet weak var  icon :UIImageView!
    @IBOutlet weak var  title :UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
       
    }

  
    
    
    func initView(){
        
//        print("initView");
//        let frame = CGRect(x: 0, y: 0, width:  (width)/2, height: 50)
        
    
      
//        self.title = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
     ///   self.title.backgroundColor = UIColor.red
       // addSubview(title)
        
//        title = UILabel(frame:frame)
//          addSubview(title)
       // self.addSubview(self.title)
        
    }
    
}
