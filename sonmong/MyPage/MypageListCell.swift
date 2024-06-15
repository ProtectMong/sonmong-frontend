//
//  MypageListCell.swift
//  sonmong
//
//  Created by 이은솔 on 5/19/24.
//

import Foundation
import UIKit
import SnapKit

class MypageListCell: UITableViewCell {
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = Constant.Color.b1
        
        return label
    }()
    
    let iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "right_arrow")
        return view
    }()
    
    let subStringLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = Constant.Color.g2
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "MypageListCell")
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        baseView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(10)
            make.trailing.equalTo(baseView.snp.trailing).offset(-22)
            make.bottom.equalTo(baseView.snp.bottom).offset(-10)
            make.width.equalTo(9)
            make.height.equalTo(16)
        }
        
        baseView.addSubview(subStringLabel)
        subStringLabel.snp.makeConstraints { make in
            make.trailing.equalTo(baseView.snp.trailing).offset(-22)
            make.top.equalTo(baseView.snp.top).offset(10)
            make.bottom.equalTo(baseView.snp.bottom).offset(-10)
        }
        
        baseView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(baseView.snp.leading).offset(22)
            make.centerY.equalTo(baseView.snp.centerY)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
