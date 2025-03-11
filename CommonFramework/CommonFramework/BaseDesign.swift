//
//  BaseDesign.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/4/17.
//

import Foundation

import Aquarius
/// 有关设计的类
open class BaseDesign: UIDesign {
    /// 颜色的标准设计库
    /// 使用方法见__BaseVC、BaseView、BaseVM、BaseCell__的相关描述
    public let colorDesign: DesignColorProtocol = ColorDesign.shared
    /// 标准样式库
    /// 这里是tableView的标准样式。如果想创建其它组件的标准样式，请按照__StyleDesign__类中的创建方法，新建对应的类
    public let tableViewStyle: DesignStyleProtocol = Common_TableViewStyle.shared
}
