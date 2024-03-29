//
//  QurationLoadingView.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/28.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class QurationLoadingView: UIView {
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.m7
        
        return view
    }()
    
    let loadingStackView:  UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    let loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "통증 분석중..."
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
//        label.numberOfLines = 3
        
        return label
    }()
    
    let lottieView: LottieAnimationView = {
        let view = LottieAnimationView(name: "quration_loading")
        view.loopMode = .loop
        view.contentMode = .scaleAspectFit
        view.animationSpeed = 1
        view.isHidden = false
        view.play()
    
        return view
    }()
    
    
    func layout(superView: UIView){
        superView.backgroundColor = Constant.Color.m7
        
        superView.addSubview(contentView)
        contentView.snp.makeConstraints{ make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.addSubview(loadingStackView)
        loadingStackView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        [lottieView, loadingLabel].forEach {
            loadingStackView.addArrangedSubview($0)
        }
    }
}
