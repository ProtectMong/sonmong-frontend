//
//  QurationSelectionStyleCell.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class QurationSelectionStyleCell: UICollectionViewCell {
    
    var disposeBag = DisposeBag()
    
    let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.layer.borderWidth = 1
        view.layer.borderColor = Constant.Color.g1.cgColor
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.textColor = Constant.Color.g5
        
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "close-outline"), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView.snp.edges)
        }
        
        baseView.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(8)
            make.trailing.equalTo(baseView.snp.trailing).offset(-10)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
        baseView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(8)
            make.leading.equalTo(baseView.snp.leading).offset(10)
            make.trailing.equalTo(deleteButton.snp.leading).offset(-6)
            make.bottom.equalTo(baseView.snp.bottom).offset(-8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
