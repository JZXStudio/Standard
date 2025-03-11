//
//  BaseCommon.swift
//  CommonFramework
//
//  Created by SONG JIN on 2024/10/22.
//

import UIKit
import Foundation

import Aquarius

struct BaseCommon {
    public static let commonResource: Bundle? = ACommon.GetMainResourceBundle(bundleName: "CommonResources")
    
    public static func getImage(imageName: String) -> UIImage {
        return BaseCommon.commonResource!.getImageResource(name: imageName)!
    }
}
