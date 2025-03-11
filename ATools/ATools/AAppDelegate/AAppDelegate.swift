//
//  AAppDelegate.swift
//  JZXSTools
//
//  Created by SONG JIN on 2024/9/13.
//

import UIKit

#if DEBUG
import DebugSwift
import LifetimeTracker
#endif

import Aquarius

open class AAppDelegate: UIResponder, UIApplicationDelegate, ANotificationDelegate {
    public var a_window: UIWindow?

    private var notification: ANotification?
    //屏幕支持旋转方向，项目中可以覆写此方法
    public var a_orientation = UIInterfaceOrientationMask.allButUpsideDown
    #if DEBUG
    private let consoleButton: DragButton = DragButton(frame: .zero)
    private var isDebugSwiftShow: Bool = false
    private var isVisibility: LifetimeTrackerDashboardIntegration.Visibility = .alwaysHidden
    private var isLifetimeTracker: Bool = false
    #endif
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        a_window = UIWindow(frame: UIScreen.main.bounds)
        
        initNotification()
        a_Bind()
        initSystemCheck()
        setupTheme()
        
        a_DidFinishLaunchingWithOptions(application, didFinishLaunchingWithOptions: launchOptions)
        
        #if DEBUG
        a_InternalDebug()
        a_Debug()
        
        a_Test()
        #endif
        
        return true
    }
    
    open func a_Bind() {}
    
    private func initSystemCheck() {
        if ACommon.isJailbroken() {
            exit(0)
        }
    }
    
    private func setupTheme() {
        self.notification = ANotification(notifications: [AThemeStyle.kNotification_UpdateThemeStyle])
        self.notification?.delegate = self
    }
    
    public func ANotificationReceive(notification: Notification) {
        if notification.name.rawValue == AThemeStyle.kNotification_UpdateThemeStyle {
            self.updateThemeStyle()
        }
    }
    #if DEBUG
    open func a_Test() {}
    open func a_Debug() {}
    
    private func a_InternalDebug() -> Void {
        AInject.inject()
    
        setupDebugSwift()
        if isLifetimeTracker {
            setupLifetimeTracker()
        }
        //setupLCManager()
        if ACommon.isSimulator() {
            setupToggleButton()
        }
    }
    
    private func setupDebugSwift() {
        DebugSwift.setup()
        DebugSwift.theme(appearance: .dark)
        DebugSwift.Debugger.logEnable = true
        DebugSwift.Debugger.feedbackEnable = true
        DebugSwift.hide()
    }
    
    private func setupLifetimeTracker() {
        LifetimeTracker.setup(
        onUpdate: LifetimeTrackerDashboardIntegration(
               visibility: .alwaysHidden,
               style: .circular,
               textColorForNoIssues: .systemGreen,
               textColorForLeakDetected: .systemRed
            ).refreshUI
        )
    }
    
    private func setupToggleButton() {
        let consoleButtonWidthAndHeight: CGFloat = 40.0
        
        consoleButton.setTitle("Debug", for: .normal)
        consoleButton.setTitleColor(.white, for: .normal)
        consoleButton.titleLabel?.font = 10.0.toBoldFont
        consoleButton.backgroundColor = .blue
        consoleButton.shadow(.darkGray)
        consoleButton.layer.cornerRadius = consoleButtonWidthAndHeight / 2
        consoleButton.size(widthHeight: consoleButtonWidthAndHeight)
        consoleButton.left(left: a_window!.width()-consoleButtonWidthAndHeight-10)
        consoleButton.top(top: 300.0)
        consoleButton.addEventBlock(.touchUpInside) { [weak self] sender in
            if self!.consoleButton.isDrag {
                return
            }
            self?.isDebugSwiftShow = !self!.isDebugSwiftShow
            if self!.isDebugSwiftShow {
                DebugSwift.show()
            } else {
                DebugSwift.hide()
            }
        }
        
        if isLifetimeTracker {
            let thirdTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleThirdTapGesture(gesture: )))
            thirdTapGesture.numberOfTapsRequired = 3
            
            consoleButton.addGestureRecognizer(thirdTapGesture)
        }
        
        self.a_window?.addSubView(consoleButton)
    }
    
    @objc
    private func handleThirdTapGesture(gesture: UITapGestureRecognizer) {
        isVisibility = isVisibility == .alwaysHidden ? .alwaysVisible : .alwaysHidden
        LifetimeTracker.configure(
            updateClosure: LifetimeTrackerDashboardIntegration(
                visibility: isVisibility,
                style: .circular,
                textColorForNoIssues: .systemGreen,
                textColorForLeakDetected: .systemRed
            ).refreshUI
        )
    }
    
    open func updateDebugView(_ point: CGPoint) -> Self {
        A.DEBUG { [weak self] in
            self?.consoleButton.point(point: point)
        }
        
        return self
    }
    #endif
    private func initNotification() {
        UNUserNotificationCenter.current().delegate = self
    }
    
    public func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.a_orientation
    }
    
    public func applicationDidEnterBackground(_ application: UIApplication) {
        //A_true(&updateApplicationDidEnterBackground)
    }
    
    public func applicationWillEnterForeground(_ application: UIApplication) {
        //A_true(&updateApplicationWillEnterForeground)
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        //A_true(&updateApplicationWillTerminate)
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        //A_true(&updateApplicationDidBecomeActive)
    }
    
    public func lockScreen() {
        if let appDelegate = UIApplication.shared.delegate as? AAppDelegate {
            appDelegate.a_orientation =  UIInterfaceOrientationMask(rawValue: UInt(UIDevice.current.orientation.rawValue))
        }
    }
    
    public func unLockScreen() {
        if let appDelegate = UIApplication.shared.delegate as? AAppDelegate {
            appDelegate.a_orientation = .all
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute: {
            UIViewController.attemptRotationToDeviceOrientation()
        })
    }
    
    open func a_DidFinishLaunchingWithOptions(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
    open func updateThemeStyle() {}
    open func a_NotificationPresent(_ notification: UNNotification) {}
    open func a_NotificationReceive(_ response: UNNotificationResponse) {}
}

extension AAppDelegate: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        a_NotificationPresent(notification)
        completionHandler(UNNotificationPresentationOptions.sound)
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        a_NotificationReceive(response)
        completionHandler()
    }
}

#if DEBUG
public class DragButton: UIButton {
    public var isDrag: Bool = false
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        isDrag = true
        
        let touch = (touches as NSSet).anyObject() as! UITouch
        let nowLocation = touch.location(in: self)
        let prevLocation = touch.previousLocation(in: self)
        
        let offsetX = nowLocation.x - prevLocation.x
        let offsetY = nowLocation.y - prevLocation.y
        
        var center = self.center
        center.x.add(offsetX)
        center.y.add(offsetY)
        
        self.center = center
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        isDrag = false
    }
}
#endif
