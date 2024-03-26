//
//  QurationHistoryTableViewCell.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationHistoryTableViewCell: UITableViewCell {
    
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        view.layer.cornerRadius = 13
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 6.0
        
        return view
    }()
    
    let tagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f2
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = Constant.Color.g1.cgColor
        
        return view
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.text = "3일차"
        label.textColor = Constant.Color.b1
        
        return label
    }()
    
    let totalTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "통증점수 00점"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "24.01.14"
        label.textColor = Constant.Color.g4
        label.font = .systemFont(ofSize: 13, weight: .regular)
        
        return label
    }()
    
    let arrowIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "chevron-forward-outline")
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "QurationHistoryTableViewCell")
        self.selectionStyle = .none
        
        self.contentView.backgroundColor = Constant.Color.f2
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(13)
            make.leading.equalTo(self.contentView.snp.leading).offset(22)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-22)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-2)
        }
        
        baseView.addSubview(arrowIconImageView)
        arrowIconImageView.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(22)
            make.trailing.equalTo(baseView.snp.trailing).offset(-22)
            make.bottom.equalTo(baseView.snp.bottom).offset(-22)
            make.width.equalTo(10)
            make.height.equalTo(16)
        }
        
        baseView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(baseView.snp.centerY)
            make.trailing.equalTo(arrowIconImageView.snp.leading).offset(-15)
        }
        
        baseView.addSubview(tagView)
        tagView.snp.makeConstraints { make in
            make.centerY.equalTo(baseView.snp.centerY)
            make.leading.equalTo(baseView.snp.leading).offset(20)
        }
        
        tagView.addSubview(tagLabel)
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(tagView.snp.top).offset(3.5)
            make.leading.equalTo(tagView.snp.leading).offset(10)
            make.trailing.equalTo(tagView.snp.trailing).offset(-10)
            make.bottom.equalTo(tagView.snp.bottom).offset(-3.5)
        }
        
        baseView.addSubview(totalTitleLabel)
        totalTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(baseView.snp.centerY)
            make.leading.equalTo(tagView.snp.trailing).offset(10)
//            make.height.equalTo(15)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
