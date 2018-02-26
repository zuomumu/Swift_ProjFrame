//
//  TBHomeViewController.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/5.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit
private let cellID = "cellID"
class TBHomeViewController: TBBaseViewController {
  private  lazy var statusList = [String]()
    override func loadData() {
        print("开始加载数据")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            for i in  0..<15{
                if self.isPullup == true {
                    self.statusList.append("上拉\(i)")
                }
                else {
                    self.statusList.insert(i.description, at: 0)////区分语境+self
                }
            }
            print("刷新表格")
            self.isPullup = false
            self.tableView?.mj_footer.endRefreshing()
            self.tableView?.mj_header.endRefreshing()
            self.tableView?.reloadData()
            
        }
    }
    
    @objc private  func newFriend() {
        print(#function)
        let vc = TBDemoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setUI() {
        super.setUI()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(newFriend))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
extension TBHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}
