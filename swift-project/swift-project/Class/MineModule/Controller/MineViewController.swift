//
//  MineViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/19.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "我的"
        let label = UILabel.initWith(frame: CGRect.init(x: 10, y: 100, width: 200, height: 200), font: UIFont.systemFont(ofSize: 15), text: "词汇网技术问答swift label的宽度和高度都固定,现在要用自定义的字体内容如何填满这个label swift label的宽度和高度都固定,现在要用自定义的字体内容如何填满这个", textColor: UIColor.red, alignment: .left)
        label.numberOfLines = 0
        self.view.addSubview(label)
    }
}
