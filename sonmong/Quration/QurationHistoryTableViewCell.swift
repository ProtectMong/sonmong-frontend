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
        
        return view
    }()
    
    let totalTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "QurationHistoryTableViewCell")
        self.selectionStyle = .none
        
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView.snp.edges)
        }
        
        baseView.addSubview(totalTitleLabel)
        totalTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(10)
            make.leading.equalTo(baseView.snp.leading).offset(10)
            make.trailing.equalTo(baseView.snp.trailing).offset(-10)
            make.bottom.equalTo(baseView.snp.bottom).offset(-10)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
