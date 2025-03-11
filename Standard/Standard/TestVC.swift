//
//  TestVC.swift
//  Standard
//
//  Created by SONG JIN on 2025/3/11.
//

import Foundation

import CommonFramework

class TestVC: BaseVC {
    public let a_view: TestView = TestView()
    public let viewModel: TestVM = TestVM()
    
    override func a_UI() {
        super.a_UI()
        
        addRootView(view: a_view)
    }
    
    override func a_UIConfig() {
        super.a_UIConfig()
        
        a_view.whiteBackgroundColor()
    }
    
    override func a_Layout() {
        super.a_Layout()
        
        a_view.equalZeroTopAndLeft()
        a_view.equalScreenSize()
    }
}
