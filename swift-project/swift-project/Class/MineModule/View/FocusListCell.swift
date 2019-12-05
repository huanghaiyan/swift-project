//
//  FocusListCell.swift
//  swift-project
//
//  Created by 黄海燕 on 2019/11/25.
//  Copyright © 2019 Herriat. All rights reserved.
//

import UIKit

protocol FocusListCellDelegate {
    func attentionAction(index:NSInteger,isSelected:Bool)
}

class FocusListCell: UITableViewCell {

    var delegate:FocusListCellDelegate?
    var cellIndex:NSInteger?
    lazy var bgImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "focusBg")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var iconImageView:UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.isUserInteractionEnabled = true
        iconImageView.image = UIImage.init(named: "my_photo_default")
        iconImageView.layer.cornerRadius = 30
        iconImageView.layer.masksToBounds = true
        return iconImageView
    }()
    
    lazy var nameLabel:UILabel = {
        let nameLabel = UILabel.initWith(frame: CGRect.zero, font: UIFont.systemFont(ofSize: 15), text: "小明", textColor: UIColor.color333333(), alignment: NSTextAlignment.left)
        return nameLabel
    }()
    
    lazy var attentionButton:UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.gray
        button.setTitle("取消关注", for: .normal)
        button.setTitleColor(UIColor.color333333(), for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action:#selector(attentionClick(button:)), for: .touchUpInside)
        return button
    }()
    
    var itemModel: FocusItemModel?{
        didSet{
            guard let itemModel = itemModel else { return }
            self.iconImageView.kf.setImage(with: URL.init(string: itemModel.userAvatar))
            self.nameLabel.text = itemModel.nickName
            if itemModel.attentionFlag == 1 {
                self.attentionButton.isSelected = true
            }else{
                self.attentionButton.isSelected = false
            }
            
            if self.attentionButton.isSelected {
                self.attentionButton.setTitle("取消关注", for: .selected)
                self.attentionButton.setTitleColor(UIColor.red, for: .selected)
            }else{
                self.attentionButton.setTitle("关  注", for: .normal)
                self.attentionButton.setTitleColor(UIColor.color333333(), for: .normal)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.clear
        self.initSubViews()
    }
    
    @objc func attentionClick(button:UIButton) {
        delegate?.attentionAction(index: self.cellIndex!, isSelected: button.isSelected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews() {
        self.contentView.addSubview(self.bgImageView)
        self.bgImageView.addSubview(self.iconImageView)
        self.bgImageView.addSubview(self.nameLabel)
        self.bgImageView.addSubview(self.attentionButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }
        
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.bgImageView.snp.left).offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        
        self.attentionButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.bgImageView.snp.right).offset(-15)
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
}
