//
//  ViewController.swift
//  Standard
//
//  Created by SONG JIN on 2025/3/18.
//

import Foundation

import Aquarius
import CommonFramework

class ViewController: BaseVC {
    private let a_view: View = View()
    private let viewModel: ViewModel = ViewModel()
    
    open override func a_UI() {
        super.a_UI()
        
        addRootView(view: a_view)
    }
    
    open override func a_UIConfig() {
        super.a_UIConfig()
        
        a_view.whiteBackgroundColor()
    }
    
    open override func a_Layout() {
        super.a_Layout()
        
        a_view.equalZeroTopAndLeft()
        a_view.equalScreenSize()
    }
}
