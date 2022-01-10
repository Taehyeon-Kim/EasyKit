//
//  File.swift
//  
//
//  Created by taehy.k on 2022/01/10.
//

import UIKit

public extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = nil
        UITabBar.appearance().backgroundImage = nil
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
