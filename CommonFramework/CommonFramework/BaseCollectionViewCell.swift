//
//  BaseCollectionCell.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/10/19.
//

import UIKit
import Foundation

import Aquarius
/// UICollectionViewCell的基类，理论上，所有的collection的cell都继承它
open class BaseCollectionViewCell: ACollectionViewCell {
    public let design: BaseDesign = BaseDesign()
    
    open override func a_UI() {
        super.a_UI()
        
        self.selectedBackgroundView = UIView()
    }
    
    open override func a_UIConfig() {
        super.a_UIConfig()
        
        //selectedBackgroundView?.backgroundColor = design.colorDesign.auxiliary3Color
    }
    
    open override func updateThemeStyle() {
        super.updateThemeStyle()
        
        //self.backgroundColor = design.colorDesign.cellBGColor
    }
}
