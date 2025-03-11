//
//  Utils.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/9/13.
//

import UIKit
import Foundation
/// 公共的工具包。一些公共的方法都放在这
public struct Utils {
    public static func alert(message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController: UIAlertController = UIAlertController(
            title: "提示",
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: handler))
        
        return alertController
    }
}
