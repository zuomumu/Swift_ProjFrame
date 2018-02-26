//
//  UIBarButtonItem+Extension.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/8.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    convenience  init(title:String,fontSize:CGFloat = 16, target:Any?,action:Selector,isBackImage:Bool = false) {
        let btn =  UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        if(isBackImage)
        {
            btn.setImage(UIImage.init(named: "backImg.png"), for: .normal)
            btn.sizeToFit()
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}
