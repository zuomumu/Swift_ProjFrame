//
//  TBBaseViewController.swift
//  swift搭建项目
//  Created by zuolixia on 2018/2/5.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit
class TBBaseViewController: UIViewController {
    lazy var navView:UIView = UIView(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:20, width: UIScreen.main.bounds.width, height: 44))
    lazy var navItem = UINavigationItem()//自定义导航条目
    var tableView : UITableView?
    var refreshControl : UIRefreshControl?
    var isPullup = false
    var userLogon = false
    
    var visitorInfoDictionary:[String:String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
    
    @objc func loadData(){
        tableView?.mj_footer.endRefreshing()
        tableView?.mj_header.endRefreshing()
    }
    override var title: String? {
        didSet{
            navItem.title = title;
        }
    }
    
    func setUI() {
//        UIApplication.shared.statusBarStyle = .lightContent
        view.backgroundColor =  UIColor.white
        setNavgationBar()
        setTableView()
    }
    
    func setTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navView)
        tableView!.contentInset =  UIEdgeInsets(top: navBar.bounds.height,
                                                left: 0,
                                                bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                                right: 0)
        tableView!.delegate = self
        tableView!.dataSource = self
        let header =  MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(headRefresh))
        tableView?.mj_header = header
        header?.isAutomaticallyChangeAlpha = true
        let footer =  MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(footRefresh))
        tableView?.mj_footer = footer
        footer?.isAutomaticallyChangeAlpha = true
    }
    @objc func headRefresh() {
        self.isPullup = false
        loadData()
    }
    @objc func footRefresh() {
        self.isPullup = true
        loadData()
    }
   
    private func setNavgationBar(){
        //取消自动缩进 -如隐藏导航条，会缩进20个点
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(navView)
        navView.addSubview(navBar)
        navBar.items = [navItem]
        //导航条泛白，系统默认的导航条透明度高---设置barTintColor渲染颜色
        //        navBar.barTintColor = UIColor(hexStr:"0xF6F6F6")
        //导航背景颜色
        navBar.barTintColor = UIColor(hexString: "0xF6F6F6")
        navView.backgroundColor = UIColor.init(hexString: "0xF6F6F6");
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.gray]
        navBar.tintColor = UIColor.orange//设置系统按钮文字颜色
    }
}
//MARK: - UITableViewDelegate,UITableViewDataSource
extension TBBaseViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
