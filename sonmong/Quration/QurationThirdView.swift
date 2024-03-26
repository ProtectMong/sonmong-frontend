//
//  QurationThirdView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationThirdView: UIView {
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
        label.backgroundColor = Constant.Color.m1
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
        label.backgroundColor = Constant.Color.m1_mate
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
        label.text = "통증과 관련된 정보를\n작성해 주세요"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아래 통증정보는 개인화된 맞춤 제공에 도움됩니다."
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painHowTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "어떻게 아프신가요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painHowTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "ex. 저려요, 찌릿찌릿해요."
        textField.layer.borderColor = Constant.Color.g1.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textColor = Constant.Color.g5
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let painWhenTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "통증은 어떤 활동을 할 때 더 심해지나요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painWhenTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "ex. 운동할 때, 무거운 물건을 들 때."
        textField.layer.borderColor = Constant.Color.g1.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textColor = Constant.Color.g5
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let painWithWorkTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "귀하의 직업이나 취미 활동이 손목에 부담을 주나요??"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painWithWorkButtonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        
        return view
    }()
    
    let painWithWorkYesButton: UIButton = {
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
    
    let painWithWorkNoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("아니오", for: .normal)
        button.setTitleColor(Constant.Color.m7, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.m7.cgColor
        button.backgroundColor = Constant.Color.m7_mate
        
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
        
        contentView.addSubview(painHowTitle)
        painHowTitle.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(painHowTextField)
        painHowTextField.snp.makeConstraints { make in
            make.top.equalTo(painHowTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(48)
        }
        
        contentView.addSubview(painWhenTitle)
        painWhenTitle.snp.makeConstraints { make in
            make.top.equalTo(painHowTextField.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(painWhenTextField)
        painWhenTextField.snp.makeConstraints { make in
            make.top.equalTo(painWhenTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(48)
        }
        
        contentView.addSubview(painWithWorkTitle)
        painWithWorkTitle.snp.makeConstraints { make in
            make.top.equalTo(painWhenTextField.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(painWithWorkButtonStackView)
        painWithWorkButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(painWithWorkTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(46)
        }
        
        [painWithWorkYesButton, painWithWorkNoButton].forEach {
            painWithWorkButtonStackView.addArrangedSubview($0)
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
