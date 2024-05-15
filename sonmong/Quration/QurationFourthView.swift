//
//  QurationFourthView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationFourthView: UIView {
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let processStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        
        return view
    }()
    
    let processOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Constant.Color.m1_mate
        label.text = "1"
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 2
        label.layer.borderColor = Constant.Color.m4_mate.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    let processTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Constant.Color.m1_mate
        label.text = "2"
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 2
        label.layer.borderColor = Constant.Color.m4_mate.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    let processThree: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Constant.Color.m1_mate
        label.text = "3"
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 2
        label.layer.borderColor = Constant.Color.m4_mate.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    let processFour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Constant.Color.m1_mate
        label.text = "4"
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 2
        label.layer.borderColor = Constant.Color.m4_mate.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    let processFive: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Constant.Color.m1
        label.text = "5"
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 2
        label.layer.borderColor = Constant.Color.m4_mate.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "과거 병력을\n선택해 주세요"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "과거 병력이 있다면 적절한 조언을 해드립니다."
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let pastPainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "과거에 손목을 다치거나 수술한 경험이 있나요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let pastPainEssentialMark: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*"
        label.textColor = Constant.Color.m1
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let pastPainButtonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        
        return view
    }()
    
    let pastPainYesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("네", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let pastPainNoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("아니오", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let pastMusclePainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "다른 관절이나 근육 관련 질환을 앓은 적이 있나요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let pastMusclePainEssentialMark: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*"
        label.textColor = Constant.Color.m1
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let pastMusclePainButtonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        
        return view
    }()
    
    let pastMusclePainYesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("네", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let pastMusclePainNoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("아니오", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let stepButtonLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.l3
        
        return view
    }()
    
    let stepButtonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.backgroundColor = Constant.Color.f2
        
        return view
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이전", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음", for: .normal)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.backgroundColor = Constant.Color.g4
        
        return button
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = .white
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
//        baseScrollView.addSubview(contentView)
//        contentView.snp.makeConstraints { make in
//            make.top.equalTo(baseScrollView.snp.top)
//            make.leading.equalTo(baseScrollView.snp.leading)
//            make.trailing.equalTo(baseScrollView.snp.trailing)
//            make.bottom.equalTo(baseScrollView.snp.bottom)
//            make.width.equalTo(baseScrollView.snp.width)
//        }
        
        contentView.addSubview(processStackView)
        processStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.width.equalTo(190)
            make.height.equalTo(30)
        }
        
        [processOne, processTwo, processThree, processFour, processFive].forEach {
            processStackView.addArrangedSubview($0)
            
            $0.snp.makeConstraints { make in
                make.width.equalTo(30)
                make.height.equalTo(30)
            }
        }
        
        contentView.addSubview(mainTitleLabel)
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(processStackView.snp.bottom).offset(21)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(pastPainTitle)
        pastPainTitle.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(pastPainEssentialMark)
        pastPainEssentialMark.snp.makeConstraints { make in
            make.top.equalTo(pastPainTitle)
            make.leading.equalTo(pastPainTitle.snp.trailing)
        }
        
        contentView.addSubview(pastPainButtonStackView)
        pastPainButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(pastPainTitle.snp.bottom).offset(14)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(46)
        }
        
        [pastPainYesButton, pastPainNoButton].forEach {
            pastPainButtonStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(pastMusclePainTitle)
        pastMusclePainTitle.snp.makeConstraints { make in
            make.top.equalTo(pastPainButtonStackView.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(pastMusclePainEssentialMark)
        pastMusclePainEssentialMark.snp.makeConstraints { make in
            make.top.equalTo(pastMusclePainTitle)
            make.leading.equalTo(pastMusclePainTitle.snp.trailing)
        }
        
        contentView.addSubview(pastMusclePainButtonStackView)
        pastMusclePainButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(pastMusclePainTitle.snp.bottom).offset(14)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(46)
        }
        
        [pastMusclePainYesButton, pastMusclePainNoButton].forEach {
            pastMusclePainButtonStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(stepButtonStackView)
        stepButtonStackView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-11)
            make.leading.equalTo(contentView.snp.leading).offset(6)
            make.trailing.equalTo(contentView.snp.trailing).offset(-6)
            make.height.equalTo(46)
        }
        
        [previousButton, nextButton].forEach {
            stepButtonStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(stepButtonLineView)
        stepButtonLineView.snp.makeConstraints { make in
            make.bottom.equalTo(stepButtonStackView.snp.top).offset(-10)
            make.trailing.equalTo(contentView.snp.trailing)
            make.leading.equalTo(contentView.snp.leading)
            make.height.equalTo(1)
        }
    }
}

