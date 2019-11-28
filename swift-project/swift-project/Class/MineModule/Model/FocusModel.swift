//
//  FocusModel.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/26.
//  Copyright © 2019 Herriat. All rights reserved.
//

import Foundation

struct FocusModel : Codable {
    var code:Int64!
    var data:FocusDataModel
    struct FocusDataModel : Codable{
        
        struct FocusItemModel : Codable{
            var id: Int64!
            var userId: String!
            var nickName: String!
            var articleCount: Int64!
            var fansCount: Int64!
            var attentionCount: Int64!
            var attentionFlag: Int64!
            var userAvatar: String!
        }
        let list: [FocusItemModel]
    }
}

