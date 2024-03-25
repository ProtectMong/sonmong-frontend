//
//  QurationMainView.swift
//  sonmong
//
//  Created by 이은솔 on 3/25/24.
//

import Foundation
import UIKit
import SnapKit

class QurationMainView: UIView {
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.m7
        
        return view
    }()
    
    let infoIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "historyInfo_icon")
        
        return view
    }()
    
    let infoMainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = Constant.Color.f1
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let attributedString = NSMutableAttributedString(string: "손목 통증을\n상담하고 바로 답변을 확인하세요")
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
                
        label.attributedText = attributedString
        return label
    }()
    
    let infoSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "의료 전문 서적 AI로 심도 있는 상담이 가능합니다."
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.f1
        
        return label
    }()
    
    let startQurationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("상담 받으러 가기", for: .normal)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = Constant.Color.b1.cgColor
        button.layer.shadowOpacity = 0.10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 1.0
        
        button.backgroundColor = Constant.Color.m2
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    let qurationListTable: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(QurationHistoryTableViewCell.self, forCellReuseIdentifier: "QurationHistoryTableViewCell")
        view.register(QurationHistoryTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "QurationHistoryTableViewHeaderView")
        view.separatorStyle = .none
        view.backgroundColor = Constant.Color.f2
//        view.contentInsetAdjustmentBehavior = .never
//        view.contentInset = UIEdgeInsets(top: -22, left: 0, bottom: 0, right: 0)
        
        if #available(iOS 15, *) {
            view.sectionHeaderTopPadding = 0
        }
        
        return view
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.f1
//        self.backgroundColor = Constant.Color.m7
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
        }
        
        contentView.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        infoView.addSubview(infoIconImageView)
        infoIconImageView.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(22)
            make.trailing.equalTo(infoView.snp.trailing).offset(-22)
            make.width.equalTo(77)
            make.height.equalTo(55.5)
        }
        
        infoView.addSubview(infoMainTitleLabel)
        infoMainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(52)
            make.leading.equalTo(infoView.snp.leading).offset(22)
        }
        
        infoView.addSubview(infoSubTitleLabel)
        infoSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoMainTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(infoView.snp.leading).offset(22)
        }
        
        infoView.addSubview(startQurationButton)
        startQurationButton.snp.makeConstraints { make in
            make.top.equalTo(infoSubTitleLabel.snp.bottom).offset(30)
            make.leading.equalTo(infoView.snp.leading).offset(22)
            make.trailing.equalTo(infoView.snp.trailing).offset(-22)
            make.bottom.equalTo(infoView.snp.bottom).offset(-24)
            make.height.equalTo(57)
        }
        
        contentView.addSubview(qurationListTable)
        qurationListTable.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

