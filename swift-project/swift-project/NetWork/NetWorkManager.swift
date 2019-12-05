//
//  NetWorkManager.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/26.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import HandyJSON

enum RequestType {
    case Get
    
    case Post
}

typealias completionBlock = (_ result :Any) -> ()

class NetWorkManager: NSObject {
    
    static let manage:SessionManager = {
        var defHeards = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]
        let defConf = URLSessionConfiguration.default
        
        defConf.timeoutIntervalForRequest = 10
        defConf.httpAdditionalHeaders = defHeards
        
        return Alamofire.SessionManager(configuration: defConf, delegate: SessionDelegate(), serverTrustPolicyManager: nil)
    }()
    
    static func requestData(URLString : String,requestType : RequestType,parameters : [String:Any]? = nil , successed : @escaping completionBlock,failured:@escaping completionBlock){
           //获取请求类型
           var method : HTTPMethod?
           
           switch requestType {
           case .Get:
               method = HTTPMethod.get
           case .Post:
               method = HTTPMethod.post
           }
           //当前时间的时间戳
           let headers:HTTPHeaders = [
               "token"     : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAwMDk3MSJ9.3dKBd4-ijIvieX05RjI6frtKzJoepmq29Z7zecUJWIM",
           ]
    
           //发送网络请求
           Alamofire.request(URLString, method: method!, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
               //获取返回结果
               switch response.result {
               case .success(let json):
                let jsonDcit = JSON(json)
                if jsonDcit["code"].intValue == 200{
                    let jsonDict = json as! Dictionary<String,Any>
                    successed(jsonDict["data"] as Any)
                }else{
                    print("连接失败")
               }
               case .failure(let error):
                   failured(error)
               }
           }
       }
}
