//
//  LauchScreenView.swift
//  sonmong
//
//  Created by 이은솔 on 3/29/24.
//

import Foundation
import UIKit
import SnapKit

class LauchScreenView: UIView {
    
    let logoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "icon")
        
        return view
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.m7
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.edges.equalTo(superView.snp.edges)
        }
        
        self.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(600)
            make.height.equalTo(600)
        }
    }
}

