//
//  QurationMainView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationMainView: UIView {
    
//    let baseScrollView: UIScrollView = {
//        let scrollView = UIScrollView(frame: .zero)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.isScrollEnabled = true
//        scrollView.showsVerticalScrollIndicator = true
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.backgroundColor = UIColor.clear
//        
//        return scrollView
//    }()
    
//    let contentView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        return view
//    }()
    
    let qurationListTable: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(QurationHistoryTableViewCell.self, forCellReuseIdentifier: "QurationHistoryTableViewCell")
        view.register(QurationHistoryTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "QurationHistoryTableViewHeaderView")
        view.separatorStyle = .none
        view.backgroundColor = Constant.Color.f1
        view.contentInsetAdjustmentBehavior = .never
        
        return view
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.m7
        self.backgroundColor = Constant.Color.m7
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.addSubview(qurationListTable)
        qurationListTable.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
