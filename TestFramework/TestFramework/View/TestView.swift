//
//  TestView.swift
//  TestFramework
//
//  Created by SONG JIN on 2025/3/18.
//
import UIKit
import Foundation

import Aquarius
import CommonFramework

class TestView: BaseView {
    private let testButton: UIButton = A.ui.button
    private let test2Button: UIButton = A.ui.button
    
    override func a_UI() {
        super.a_UI()
        
        addSubviews(views: [
            testButton,
            test2Button
        ])
    }
    
    override func a_UIConfig() {
        super.a_UIConfig()
        
        testButton.setTitle("Test", for: .normal)
        testButton.setTitleColor(.white, for: .normal)
        testButton.backgroundColor = .blue
        /*
        testButton.layer.masksToBounds = true
        testButton.shadow(.darkGray)
        testButton.layer.cornerRadius = 8.0
         */
        testButton.styleDesign(design.buttonStyle)
        
        test2Button.setTitle("Test2", for: .normal)
        test2Button.setTitleColor(.white, for: .normal)
        test2Button.backgroundColor = .red
        test2Button.styleDesign(design.buttonStyle)
    }
    
    override func a_Layout() {
        super.a_Layout()
        
        testButton.size(sizes: [150.0, 50.0])
        testButton.top(top: 300.0)
        testButton.left(left: 100.0)
        
        test2Button.equalSize(target: testButton)
        test2Button.alignTop(view: testButton, offset: 16.0)
        test2Button.equalLeft(target: testButton)
    }
    
    override func a_Event() {
        super.a_Event()
        
        testButton.addEventBlock(.touchUpInside) { [weak self] sender in
            sender.top(top: sender.top()+40, animate: true)
            
            self?.Manage_PostNotification("test")
        }
    }
}
