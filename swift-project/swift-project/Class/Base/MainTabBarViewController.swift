//
//  MainTabBarViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/19.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeVC = HomeViewController()
        let homeNav = UINavigationController.init(rootViewController: homeVC)
        self.customTabBarItem(vc: homeVC, title: "首页", normalImage: UIImage.init(named: "home_normal")!, selectedImage: UIImage.init(named: "home_selected")!)
        
        let forumVC = ForumViewController()
        let forumNav = UINavigationController.init(rootViewController: forumVC)
        self.customTabBarItem(vc: forumVC, title: "车友会", normalImage: UIImage.init(named: "forum_normal")!, selectedImage: UIImage.init(named: "forum_selected")!)
        
        let mineVC = MineViewController()
        let mineNav = UINavigationController.init(rootViewController: mineVC)
        self.customTabBarItem(vc: mineVC, title: "我的", normalImage: UIImage.init(named: "mine_normal")!, selectedImage: UIImage.init(named: "mine_selected")!)
        
        self.setViewControllers([homeNav,forumNav,mineNav], animated: true)
        if #available(ios 13.0, *) {
            //适配iOS13, UITabBar 的 Item 未选中颜色
            self.tabBar.unselectedItemTintColor = UIColor.color333333()
        }
    }
    
    func customTabBarItem(vc:UIViewController,title:String,normalImage:UIImage,selectedImage:UIImage) {
        vc.tabBarItem = UITabBarItem(title: title, image: normalImage.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.color333333()], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.color333333()], for: .selected)
    }
}
