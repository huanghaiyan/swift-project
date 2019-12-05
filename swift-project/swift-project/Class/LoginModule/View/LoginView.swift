//
//  LoginView.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/29.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func requestVerifyCode()
    func moblieLogin()
}

class LoginView: UIView {
    var delegate:LoginViewDelegate?
    lazy var mobileBgImgView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.colorWithRgb(r: 255.0, g: 255.0, b: 255.0, alpha: 0.75)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.layer.borderColor = UIColor.color333333().cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    lazy var mobileTextField:UITextField = {
        let textField = UITextField.init()
        let placeholderString = NSMutableAttributedString.init(string: "请输入您的手机号", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        textField.attributedPlaceholder = placeholderString
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    lazy var verifyCodeBgImgView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.colorWithRgb(r: 255.0, g: 255.0, b: 255.0, alpha: 0.75)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.layer.borderColor = UIColor.color333333().cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    lazy var verifyCodeTextField:UITextField = {
        let textField = UITextField.init()
        let placeholderString = NSMutableAttributedString.init(string: "请输入您的验证码", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        textField.attributedPlaceholder = placeholderString
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    lazy var verifyCodeBtn:UIButton = {
        let button:UIButton = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("获取验证码", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.addTarget(self, action: #selector(getVerifyCode), for: .touchUpInside)
        return button
    }()

    lazy var loginBtn:UIButton = {
        let button:UIButton = UIButton.init(type: .custom)
        button.setBackgroundImage(UIImage.init(named: "loginBtn_bg"), for: .normal)
        button.setTitle("登   录", for: .normal)
        button.setTitleColor(UIColor.color333333(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews() {
        self.addSubview(self.mobileBgImgView)
        self.mobileBgImgView.addSubview(self.mobileTextField)
        self.mobileBgImgView.addSubview(self.verifyCodeBtn)
        
        self.addSubview(self.verifyCodeBgImgView)
        self.verifyCodeBgImgView.addSubview(self.verifyCodeTextField)
        self.addSubview(self.loginBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mobileBgImgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
            make.height.equalTo(41)
        }
        
        self.verifyCodeBtn.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(self.mobileBgImgView)
            make.width.equalTo(100)
        }
        
        self.mobileTextField.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.mobileBgImgView)
            make.left.equalTo(self.mobileBgImgView.snp.left).offset(8)
            make.right.equalTo(self.verifyCodeBtn.snp.left).offset(-10)
        }
        
        self.verifyCodeBgImgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mobileBgImgView.snp.bottom).offset(15)
            make.left.right.equalTo(self.mobileBgImgView)
            make.height.equalTo(41)
        }
        
        self.verifyCodeTextField.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(self.verifyCodeBgImgView)
            make.left.equalTo(self.verifyCodeBgImgView.snp.left).offset(8)
        }
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.verifyCodeBgImgView.snp.bottom).offset(37)
            make.height.equalTo(58)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    @objc func getVerifyCode() {
        self.delegate?.requestVerifyCode()
    }
    
    @objc func loginBtnClick() {
        self.delegate?.moblieLogin()
    }
}
