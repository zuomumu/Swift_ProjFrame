//
//  TBDemoViewController.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/8.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit

class TBDemoViewController: TBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第\(self.navigationController?.childViewControllers.count ?? 0)页"
        // Do any additional setup after loading the view.
    }
    @objc private  func nextPush() {
        print(#function)
        let vc = TBDemoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setUI() {
        super.setUI()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一步", target: self, action: #selector(nextPush))
    }
}
