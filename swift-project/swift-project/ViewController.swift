//
//  ViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/12.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let lab = UILabel.init()
        lab.text = "ha"
        self.view.addSubview(lab)
        
        let str2 = String()
        if str2.isEmpty{
        print("字符串为空")
        }
         
    }


}

