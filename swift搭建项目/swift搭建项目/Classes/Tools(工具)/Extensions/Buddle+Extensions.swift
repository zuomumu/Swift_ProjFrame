//
//  Buddle+Extensions.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/2/5.
//  Copyright © 2018年 . All rights reserved.
//

import Foundation
extension Bundle{
    func namespace() -> String {
        let nameS =  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        return nameS
    }
}
