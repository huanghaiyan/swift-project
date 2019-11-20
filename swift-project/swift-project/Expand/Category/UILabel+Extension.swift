//
//  UILabel+Extension.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/20.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

import UIKit

extension UILabel{
    public static func initWith(frame:CGRect,font:UIFont,text:String,textColor:UIColor,alignment:NSTextAlignment) -> UILabel {
        let label = UILabel.init(frame: frame)
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
        return label
    }
}
