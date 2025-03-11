//
//  BaseVC.swift
//  CommonFramework
//
//  Created by SONG JIN on 2023/1/15.
//

import UIKit
import Foundation

import ATools
import Aquarius

public enum BaseOrientationMask: Int {
    case portrait = 0
    case landscapeLeft = 1
    case landscapeRight = 2
    case portraitUpsideDown = 3
    case landscape = 4
    case all = 5
    case allButUpsideDown = 6
}
/// viewController的基类。理论上，所有的viewController都继承它
open class BaseVC: AViewController {
    private let navigationAppearance = UINavigationBarAppearance()
    private let tabBarAppearance = UITabBarAppearance()
    /// 标准设计库，包含
    /// + 颜色库
    /// + 样式库
    ///
    /// 注意：除特定情况，一般不要在viewController中设置组件样式。组件样式应在view中设置
    ///
    /// 示例：
    ///
    /// __Test.swift__
    ///
    /// ```swift
    /// class TestVC: BaseVC {
    ///     override func a_UIConfig() {
    ///         super.a_UIConfig()
    ///
    ///         a_view.testButton.backgroundColor(design.colorDesign.bgColor)
    ///     }
    /// ```
    public let design = BaseDesign()
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavigationThemeStyle()
        configTabBarThemeStyle()
    }
    
    open override func a_Begin() {
        super.a_Begin()
        
        lockOrientation(.portrait)
    }
    
    open override func a_Navigation() {
        super.a_Navigation()
        
        configBarButtonTintColor()
    }
    
    open override func updateThemeStyle() {
        super.updateThemeStyle()
        
        configNavigationThemeStyle()
        configTabBarThemeStyle()
    }
    
    private func configNavigationThemeStyle() {
        navigationAppearance.configureWithOpaqueBackground()
        //navigationAppearance.backgroundColor = design.colorDesign.navigationBGColor
        navigationAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.white
        ]
        
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        configBarButtonTintColor()
    }
    
    private func configBarButtonTintColor() {
        self.navigation_LeftBarButtonTintColor(.white)
        //self.navigation_RightBarButtonTintColor(design.colorDesign.auxiliary1Color)
    }
    
    private func configTabBarThemeStyle() {
        tabBarAppearance.backgroundColor = design.colorDesign.tabBarBGColor
        
        if #available(iOS 15.0, *) {
            tabBarController?.tabBar.standardAppearance = tabBarAppearance
            tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBar.standardAppearance
        }
    }
    
    @objc
    open func navigationBackAction() -> Void {
        self.hidesBottomBarWhenPushed = false
        self.popViewController()
    }
    //锁定屏幕方向
    public func lockOrientation(_ orientation: UIDeviceOrientation = UIDevice.current.orientation) {
        if let appDelegate = UIApplication.shared.delegate as? AAppDelegate {
            appDelegate.a_orientation = interfaceOrientationMask(from: orientation)
        }
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    public func lockOrientation(_ orientation: Int) {
        lockOrientation(UIDeviceOrientation(rawValue: orientation)!)
    }
    
    //解锁屏幕方向
    public func unlockOrientation(_ orientationMask: UIInterfaceOrientationMask = .allButUpsideDown) {
        if let appDelegate = UIApplication.shared.delegate as? AAppDelegate {
            appDelegate.a_orientation = orientationMask
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute: {
            UIViewController.attemptRotationToDeviceOrientation()
        })
    }
    
    public func unlockOrientation(_ orientation: Int) {
        var orientationMask: UIInterfaceOrientationMask = .portraitUpsideDown
        switch BaseOrientationMask(rawValue: orientation) {
        case .all:
            orientationMask = .all
            break
        case .allButUpsideDown:
            orientationMask = .allButUpsideDown
            break
        case .landscape:
            orientationMask = .landscape
            break
        case .landscapeLeft:
            orientationMask = .landscapeLeft
            break
        case .landscapeRight:
            orientationMask = .landscapeRight
            break
        case .portrait:
            orientationMask = .portrait
            break
        case .portraitUpsideDown:
            orientationMask = .portraitUpsideDown
            break
        case .none:
            orientationMask = .portraitUpsideDown
        }
        unlockOrientation(orientationMask)
    }
}
