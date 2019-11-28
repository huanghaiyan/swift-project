//
//  AppMacro.h
//  swift-project
//
//  Created by 黄海燕 on 2019/11/19.
//  Copyright © 2019 Herriat. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kNavigationBarHeight = 44+kStatusBarHeight
let kBottonSafeAreaHeight = UIApplication.shared.statusBarFrame.size.height>20?34:0

#endif /* AppMacro_h */
