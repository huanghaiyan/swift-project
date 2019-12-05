//
//  FocusListViewController.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/25.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class FocusListViewController: BaseViewController {
    var focusModel:FocusModel!
    var dataArray:[FocusItemModel] = []
    var cellId = "FocusListCell"
    
    //顶部刷新
    let header = MJRefreshNormalHeader()
    //底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.register(FocusListCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "我的关注"
    
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.right.left.equalTo(self.view);
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        header.setRefreshingTarget(self, refreshingAction: #selector(FocusListViewController.headerRefresh))
        footer.setRefreshingTarget(self, refreshingAction: #selector(FocusListViewController.footerRefresh))
        self.tableView.mj_header = header
        self.tableView.mj_footer = footer
        self.loadData()
    }
    
    func loadData(){
        
        NetWorkManager.requestData(URLString: "https://api.xingke.cn/bbs/api/user/getUserAttentionListByUserId", requestType: .Post, parameters:["userId": "10000971","queryUserId":"10000971","pageNum":"1","pageSize":"10"], successed: { (result) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            
            let jsonData = try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
            self.focusModel = try! JSONDecoder().decode(FocusModel.self, from: jsonData)
            self.dataArray.append(contentsOf: self.focusModel.list)
            
            self.tableView.reloadData()
        }, failured: {(result) in
            
        })
    }
    
    @objc func headerRefresh() {
        print("下拉刷新")
        self.loadData()
    }
    
    @objc func footerRefresh() {
        print("上拉加载更多")
        self.loadData()
    }
}

extension FocusListViewController:UITableViewDelegate,UITableViewDataSource,FocusListCellDelegate{
    
    func attentionAction(index: NSInteger, isSelected: Bool) {
        print("关注%@",isSelected)
        var typeStr = "0"
        if isSelected {
            typeStr = "1"
        }
        let dict = ["userId": "10000971","attentionUserId":self.dataArray[index].userId,"type":typeStr]
        
        NetWorkManager.requestData(URLString: "https://api.xingke.cn/bbs/api/userAttention/attention", requestType: .Post, parameters: dict as [String : Any], successed: { (result) in
            self.dataArray[index].attentionFlag = 0
            self.tableView.reloadData()
        }, failured: {(result)in

        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FocusListCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FocusListCell
        cell.cellIndex = indexPath.section
        cell.delegate = self
        cell.itemModel = self.dataArray[indexPath.section]
        return cell
    }
}
