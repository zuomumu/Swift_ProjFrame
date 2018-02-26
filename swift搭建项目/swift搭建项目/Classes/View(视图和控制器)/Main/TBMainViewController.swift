//
//  TBMainViewController.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/5.
//  Copyright © 2018年 左. All rights reserved.
//Ctrl+6:智能搜索

import UIKit

class TBMainViewController: UITabBarController {

    lazy var composeButton = { () -> UIButton in
        let compostBtn = UIButton(type: UIButtonType.custom)
        compostBtn .setImage(UIImage.init(named: "work_tab_jia"), for: .normal)
        return compostBtn;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        setupComposeButton()
    }
    //此处系统TabbarButton总是覆盖composeButton,需要将其放置前方
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.bringSubview(toFront: composeButton)
    }
    //设置支持方向后，当前控制器及子控制器都会遵循
    //如播放视频，通常是modal展现的
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    private func setupTabbar(){
        let array = defaultJson()
        for  dict in array
        {
            let vc =  setUpViewController(dic: dict)
            self.addChildViewController(vc)
        }
    }
    
    //MARK: - 监听方法
    ///objc:允许这个函数在运行是通过OC消息机制被调用
    //FIXME: 没有实现
    @objc private func composeStatus() {
//        print("点击")
        let vcs = UIViewController()
        vcs.view.backgroundColor =  UIColor.randomColorF()
        let nvc = UINavigationController.init(rootViewController: vcs)
        present(nvc, animated: true, completion: nil)
    }
}
extension TBMainViewController{
    private func setupComposeButton() {
        let widthPer =  self.tabBar.bounds.size.width / CGFloat(childViewControllers.count ) - 1
        self.composeButton.frame = CGRect(x: 0, y: 0, width: widthPer, height: self.tabBar.bounds.size.height)
        //正数向内扩展,盖住容错点
        self.composeButton.frame = tabBar.bounds.insetBy(dx: 2 * widthPer, dy: 0)
        composeButton.addTarget(self, action:#selector(composeStatus), for: .touchUpInside)
        tabBar.addSubview(composeButton)
    }
    private func setUpViewController(dic: [String:AnyObject])-> UIViewController {
        guard let  clsName = dic["clsName"] as? String ,
            let title = dic["title"] as? String,
            let imageName = dic["imageName"] as? String,
        let cls = NSClassFromString(Bundle.main.namespace()+"." + clsName) as? TBBaseViewController.Type
        else {
            return UIViewController()
        }
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image =  UIImage.init(named: imageName)
        vc.visitorInfoDictionary = dic["visitorInfo"] as? [String:String]
        vc.tabBarItem.selectedImage =  UIImage.init(named: imageName + "_select")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem .setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.orange], for: .selected)
        //系统默认12号字体，设置字体必须是.nomal
//        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)], for: .normal)
        let naVBase =  TBNavigationController(rootViewController: vc)
        return naVBase
    }
}
extension TBMainViewController{
    func defaultJson() -> [[String:AnyObject]] {
        let array:[[String:AnyObject]] = [
            ["title":"校园" as AnyObject,"clsName":"TBHomeViewController" as AnyObject,"imageName":"menu_ketang" as AnyObject,"visitorInfo":["imageName":"","message":"校园哈哈"] as AnyObject],
            ["title":"消息" as AnyObject,"clsName":"TBMessageViewController" as AnyObject,"imageName":"menu_message" as AnyObject,"visitorInfo":["imageName":"","message":"消息哈哈"] as AnyObject],
            ["title":"add" as AnyObject],
            ["title":"发现" as AnyObject,"clsName":"TBDisconverViewController" as AnyObject,"imageName":"menu_discovery" as AnyObject,"visitorInfo":["imageName":"","message":"发现哈哈"] as AnyObject],
            ["title":"我" as AnyObject,"clsName":"TBProfileViewController"  as AnyObject,"imageName":"menu_self" as AnyObject,"visitorInfo":["imageName":"","message":"我哈哈"] as AnyObject]
        ]
        return array
    }
}
