//
//  BaseVM.swift
//  CommonFramework
//
//  Created by SONG JIN on 2023/1/15.
//

import Foundation

import Aquarius
/// viewModel的基类，理论上，所有的viewModel都继承它
open class BaseVM: AViewModel {
    public let design = BaseDesign()
}
