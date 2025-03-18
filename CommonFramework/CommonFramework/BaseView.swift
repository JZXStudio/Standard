//
//  BaseView.swift
//  CommonFramework
//
//  Created by SONG JIN on 2023/1/15.
//

import UIKit
import Foundation

import Aquarius
/// view的基类。理论上，所有的view都继承它
open class BaseView: AView {
    public var bindKeys: Array<String> = []
    
    public let design = BaseDesign()
    
    open override func a_Clear() {
        super.a_Clear()
        
        clearBinds(bindKeys: bindKeys)
    }
    
    open override func updateThemeStyle() {
        super.updateThemeStyle()
        
        self.backgroundColor = design.colorDesign.bgColor
        self.getViewController()?.view.backgroundColor = design.colorDesign.bgColor
    }
    
    open func a_Inject() {}
    
    @objc
    public func injected() {
        a_Inject()
    }
}
