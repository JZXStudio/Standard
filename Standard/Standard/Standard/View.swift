//
//  View.swift
//  Standard
//
//  Created by SONG JIN on 2025/3/18.
//
import UIKit
import Foundation

import Aquarius
import CommonFramework

class View: BaseView {
    private let testButton: UIButton = A.ui.button
    
    override func a_UI() {
        super.a_UI()
        
        addSubviews(views: [
            testButton
        ])
    }
    
    override func a_UIConfig() {
        super.a_UIConfig()
        
        testButton.setTitle("Test", for: .normal)
        testButton.setTitleColor(.white, for: .normal)
        testButton.backgroundColor = .blue
        testButton.layer.masksToBounds = true
        testButton.shadow(.darkGray)
        testButton.layer.cornerRadius = 8.0
    }
    
    override func a_Layout() {
        super.a_Layout()
        
        testButton.size(sizes: [150.0,150.0])
        testButton.top(top: 200.0)
        testButton.left(left: 100.0)
    }
    
    override func a_Event() {
        super.a_Event()
        
        testButton.addEventBlock(.touchUpInside) { sender in
            sender.top(top: sender.top()+40, animate: true)
        }
    }
}
