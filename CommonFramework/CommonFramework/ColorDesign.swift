//
//  BaseDesignColor.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/4/17.
//

import UIKit
import Foundation

import Aquarius
/// 颜色库
/// __DesignColorProtocol__中定义了标准组件的颜色
/// 也可以自定义颜色
class ColorDesign: DesignColorProtocol {
    ///背景颜色
    ///__Light:__普通状态下的颜色
    ///__Dark:__深色模式下的颜色
    var bgColor: UIColor {
        get {
            AThemeStyle.getThemeColor([
                .Light : 0xF5F5F5.a_color,
                .Dark : 0x151F2E.a_color
            ])
        }
    }
    
    public static let shared = ColorDesign()
}
