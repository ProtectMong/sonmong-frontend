//
//  MyPageView.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import UIKit
import SnapKit

class MyPageView: UIView {
    let baseScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.clear
        
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let userInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        return view
    }()
    
    let userNameWithHelloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.Color.g6
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.Color.g4
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let manageAccountView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        return view
    }()
    
    let manageAccountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "계정관리"
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let manageAccountTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MypageListCell.self, forCellReuseIdentifier: "MypageListCell")
        view.separatorStyle = .none
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let termAndPoliciesView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        return view
    }()
    
    let termAndPoliciesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "운영 및 정책"
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let termAndPoliciesTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MypageListCell.self, forCellReuseIdentifier: "MypageListCell")
        view.separatorStyle = .none
        view.backgroundColor = UIColor.clear
        return view
    }()

    let appVersionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        return view
    }()
    
    let appVersionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = Constant.Color.b1
        
        return label
    }()
    
    let appVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = Constant.Color.g2
        
        return label
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.f2
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.addSubview(baseScrollView)
        baseScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        baseScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(baseScrollView.snp.top)
            make.leading.equalTo(baseScrollView.snp.leading)
            make.trailing.equalTo(baseScrollView.snp.trailing)
            make.bottom.equalTo(baseScrollView.snp.bottom)
            make.width.equalTo(baseScrollView.snp.width)
        }
        
        contentView.addSubview(userInfoView)
        userInfoView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        userInfoView.addSubview(userNameWithHelloLabel)
        userNameWithHelloLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.top).offset(27)
            make.leading.equalTo(userInfoView.snp.leading).offset(22)
        }
        
        userInfoView.addSubview(userEmailLabel)
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameWithHelloLabel.snp.bottom).offset(7)
            make.leading.equalTo(userInfoView.snp.leading).offset(22)
            make.bottom.equalTo(userInfoView.snp.bottom).offset(-27)
        }
        
        contentView.addSubview(manageAccountView)
        manageAccountView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
        }
        
        manageAccountView.addSubview(manageAccountTitleLabel)
        manageAccountTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(manageAccountView.snp.top).offset(27)
            make.leading.equalTo(manageAccountView.snp.leading).offset(22)
        }
        
        manageAccountView.addSubview(manageAccountTableView)
        manageAccountTableView.snp.makeConstraints { make in
            make.top.equalTo(manageAccountTitleLabel.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalTo(manageAccountView.snp.bottom).offset(-27)
        }
        
        contentView.addSubview(termAndPoliciesView)
        termAndPoliciesView.snp.makeConstraints { make in
            make.top.equalTo(manageAccountView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
        }
        
        termAndPoliciesView.addSubview(termAndPoliciesTitleLabel)
        termAndPoliciesTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(termAndPoliciesView.snp.top).offset(27)
            make.leading.equalToSuperview().offset(22)
        }
        
        termAndPoliciesView.addSubview(termAndPoliciesTableView)
        termAndPoliciesTableView.snp.makeConstraints { make in
            make.top.equalTo(termAndPoliciesTitleLabel.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(termAndPoliciesView.snp.bottom).offset(-27)
            make.height.equalTo(100)
        }
    }
    
}
