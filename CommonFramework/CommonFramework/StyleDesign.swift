//
//  CellTitleDesign.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/4/18.
//

import UIKit
import Foundation

import Aquarius
/// 标准样式库
/// __DesignStyleProtocol__中定义了组件的标准样式
/// 可以为每个组件创建单独的样式，只需新建该组件的标准样式类，并继承__DesignStyleProtocol__
/// 在类中，设置组件样式的属性值
class Common_TableViewStyle: DesignStyleProtocol {
    var separatorStyle: Any = UITableViewCell.SeparatorStyle.none
    var separatorInset: Any = UIEdgeInsets.zero
    var sectionHeaderHeight: Any = 1.0
    var sectionFooterHeight: Any = 8.0
    
    public static let shared = Common_TableViewStyle()
}

class Common_ButtonStyle: DesignStyleProtocol {
    var maskToBounds: Any = true
    var shadow: Any = UIColor.darkGray
    var radius: Any = 16.0
    
    public static let shared = Common_ButtonStyle()
}
