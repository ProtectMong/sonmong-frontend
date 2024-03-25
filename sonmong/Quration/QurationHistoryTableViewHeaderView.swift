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
        view.backgroundColor = Constant.Color.m7
        
        return view
    }()
    
    let qurationInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AI 전문가에게 작성하고\n손목통증을 진단 하쇼!"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = Constant.Color.f1
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let startQurationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("문답시작!", for: .normal)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.backgroundColor = Constant.Color.m2
        button.isUserInteractionEnabled = true
        
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
        
        baseView.addSubview(qurationInfoTitleLabel)
        qurationInfoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top)
            make.leading.equalTo(baseView.snp.leading).offset(22)
        }
        
        baseView.addSubview(startQurationButton)
        startQurationButton.snp.makeConstraints { make in
            make.top.equalTo(qurationInfoTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(baseView.snp.leading).offset(22)
            make.trailing.equalTo(baseView.snp.trailing).offset(-22)
            make.bottom.equalTo(baseView.snp.bottom).offset(-30)
            make.height.equalTo(62)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
