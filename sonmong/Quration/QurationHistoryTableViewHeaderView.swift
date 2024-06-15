//
//  QurationHistoryTableViewHeaderView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import Foundation
import UIKit
import SnapKit

class QurationHistoryTableViewHeaderView: UITableViewHeaderFooterView {
    
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
//        view.layer.cornerRadius = 13
//        view.layer.shadowColor = Constant.Color.b1.cgColor
//        view.layer.shadowOpacity = 0.3
//        view.layer.shadowOffset = CGSize(width: 0, height: 4)
//        view.layer.shadowRadius = 4.0
        view.layer.borderColor = Constant.Color.l2.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let totalNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = Constant.Color.g4
        
        return label
    }()
    
    let sortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("오래된 순", for: .normal)
        button.setTitleColor(Constant.Color.g4, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setImage(UIImage(named: "chevron-down-outline"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: "NoticeTableHeaderView")
        self.backgroundColor = Constant.Color.m7
        
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        baseView.addSubview(sortButton)
        sortButton.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(18)
            make.trailing.equalTo(baseView.snp.trailing).offset(-22)
            make.bottom.equalTo(baseView.snp.bottom).offset(-18)
            make.width.equalTo(82)
        }
        
        baseView.addSubview(totalNumberLabel)
        totalNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(18)
            make.leading.equalTo(baseView.snp.leading).offset(22)
            make.bottom.equalTo(baseView.snp.bottom).offset(-18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
