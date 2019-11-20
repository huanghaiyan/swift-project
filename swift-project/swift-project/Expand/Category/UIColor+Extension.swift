//
//  UIColor+Extension.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/20.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

import UIKit

extension UIColor{
    
    public static func themeColor() -> UIColor {
        return UIColor.colorWithHexString("#ffda1c")
    }
    
    public static func color333333() -> UIColor {
        return UIColor.colorWithHexString("#333333")
    }
    
    public static func lineColor() -> UIColor {
        return UIColor.colorWithHexString("#E0E0E0")
    }
    
    /// UIColor 16进制编码转换Color
    public static func colorWithHexString(_ color_hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexStr = color_hex.uppercased()
        if (hexStr.hasPrefix("#")) {
            hexStr = (hexStr as NSString).substring(from: 1)
        }
        let scanner = Scanner(string: hexStr)
        scanner.scanLocation = 0
        var RGBValue: UInt64 = 0
        scanner.scanHexInt64(&RGBValue)
        let r = (RGBValue & 0xff0000) >> 16
        let g = (RGBValue & 0xff00) >> 8
        let b = RGBValue & 0xff
        return UIColor(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: alpha)
    }
    
    /// RGB形式转换Color
    public static func colorWithRgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    public static func colorWithHexString(_ color_hex: String) -> UIColor{
        return UIColor.colorWithHexString(color_hex, alpha: 1.0)
    }
}
