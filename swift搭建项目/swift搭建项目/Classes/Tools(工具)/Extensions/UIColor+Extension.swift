//
//  UIColor+Extension.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/8.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit
extension UIColor{

    public var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
//    类方法  生成随机颜色
    class func randomColorF()-> UIColor {
        return UIColor(hue: CGFloat(arc4random_uniform(256))/CGFloat(255.0), saturation: CGFloat(arc4random_uniform(256))/CGFloat(255.0), brightness: CGFloat(arc4random_uniform(256))/CGFloat(255.0), alpha: 1)
    }
    public convenience init(hexStr: String) {
        let scanner = Scanner(string: hexStr)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

