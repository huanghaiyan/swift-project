//
//  LoginViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/29.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    lazy var bgImgView:UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "login_bg"))
        return imageView
    }()
    
    lazy var logoImgView:UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "xklogo"))
        return imageView
    }()
    
    lazy var loginView:LoginView = {
        let view = LoginView.init(frame: CGRect.zero)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: UIColor.clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.view.addSubview(self.bgImgView)
        self.view.addSubview(self.logoImgView)
        self.view.addSubview(self.loginView)
        
        self.bgImgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        self.logoImgView.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.width.equalTo(113)
            make.height.equalTo(93)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        self.loginView.snp.makeConstraints { (make) in
            make.top.equalTo(logoImgView.snp.bottom).offset(30)
            make.left.right.bottom.equalTo(self.view)
        }
    }
}

extension LoginViewController:LoginViewDelegate{
    func requestVerifyCode() {
        //https://api.xingke.cn/api/publicservice/sendSmsMsg
        NetWorkManager.requestData(URLString: "https://api.xingke.cn/api/publicservice/sendSmsMsg", requestType: .Post, parameters: ["phoneNum":self.loginView.mobileTextField.text as Any], successed: { (result) in
            
        }, failured: { (result) in
            
        })
    }
    
    func moblieLogin() {
        NetWorkManager.requestData(URLString: "https://api.xingke.cn/api/mobileuser/fastLogin", requestType: .Post, parameters: ["phoneNum":self.loginView.mobileTextField.text as Any,"smsCode":self.loginView.verifyCodeTextField.text as Any], successed: { (result) in
            print(result)
            
            let jsonData = try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
            let userModel:UserModel = try! JSONDecoder().decode(UserModel.self, from: jsonData)
//            self.navigationController?.popViewController(animated: true)
            
        }, failured: {(result) in
            
        })
    }
}
