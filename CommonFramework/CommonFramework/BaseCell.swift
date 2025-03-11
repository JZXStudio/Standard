//
//  BaseCell.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/4/17.
//

import UIKit
import Foundation

import Aquarius
/// UITableViewCell的基类，理论上，所有的cell都继承它
open class BaseCell: ATableViewCell {
    public let accessoryImageView: UIImageView = A.ui.imageView
    public let separatorView: UIView = A.ui.view
    
    public let design: BaseDesign = BaseDesign()
    
    private var separatorPosition: CGFloat = 8.0
    
    open override func a_UI() {
        super.a_UI()
        
        self.selectedBackgroundView = UIView()
        self.addSubviewInContentView(view: separatorView)
    }
    
    open override func a_UIConfig() {
        super.a_UIConfig()
        
        selectedBackgroundView?.backgroundColor = design.colorDesign.cellSelectedColor
        
        //accessoryImageView.image = BaseCommon.getImage(imageName: "arrow-right.png").withTintColor(design.colorDesign.cellAccessoryViewColor!)
    }
    
    open override func updateThemeStyle() {
        super.updateThemeStyle()
        
        //self.backgroundColor = design.colorDesign.cellBGColor
        //self.accessoryImageView.image = BaseCommon.getImage(imageName: "arrow-right.png").withTintColor(design.colorDesign.cellAccessoryViewColor!)
        
        separatorView.backgroundColor = AThemeStyle.getThemeColor([
                .Light : 0xCBCBCB.a_color ~ 50%,
                .Dark : 0x343B48.a_color
            ])
    }
    
    open override func a_Layout() {
        super.a_Layout()
        
        accessoryImageView.size(sizes: [18.0, 24.0])
        accessoryImageView.equalZeroTopAndLeft()
    }
    
    open override func configWithCell(cellData: Any) {
        super.configWithCell(cellData: cellData)
        
        configSeparatorView()
    }
    
    private func configSeparatorView() {
        separatorView.size(sizes: [
            self.width()-separatorPosition*2,
            1.0
        ])
        separatorView.left(left: separatorPosition)
        separatorView.top(top: self.height()-separatorView.height())
    }
    @discardableResult
    public func updateSeparatorView(_ isHidden: Bool) -> Self {
        separatorView.isHidden(isHidden)
        
        return self
    }
    @discardableResult
    public func updateSeparatorPosition(_ position: CGFloat) -> Self {
        separatorPosition = position
        separatorView.left(left: separatorPosition)
        separatorView.width(width: self.width()-separatorPosition*2)
        
        return self
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        configSeparatorView()
    }
}
