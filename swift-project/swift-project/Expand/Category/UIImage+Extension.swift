//
//  UIImage+Extension.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/12/4.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

import UIKit

extension UIImage{
    public static func imageWithColor(color:UIColor) -> UIImage{
        let rect:CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
