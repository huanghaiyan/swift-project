//
//  UserModel.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/12/4.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

struct UserModel:Codable {
    var userId:String!   //用户id
    var userName:String! //真实名称
    var nickName:String! //昵称
    var userIntegral:Int64! //积分
    var userAvatar:String!   //头像地址
    var phoneNum:String! //手机号
    var inviteCode:String!   //邀请码
    var gender:String!   //性别
    var birthday:String! //生日
    var token:String!    //登录token
    var registerOrgNo:String!    //支付商户机构号
    var bindCardStatus:String!   //是否绑定银行卡  0:否  1:是
    var existPayPassword:String! //是否设置支付密码 0:否 1:是
    var userStatus:String!       //用户状态 0:初始化,1:正常, 2:停用
}
