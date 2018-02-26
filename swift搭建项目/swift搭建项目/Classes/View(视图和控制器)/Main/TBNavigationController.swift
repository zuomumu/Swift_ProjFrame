//
//  TBNavigationController.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/5.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit

class TBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if(self.childViewControllers.count>0)
        {
            let titlea = (self.childViewControllers.count == 1 ? title : "返回")
             viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? TBBaseViewController {
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: titlea!, target: self, action: #selector(popVC),isBackImage:true)
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc private func popVC() {
        self.popViewController(animated: true)
    }
}
