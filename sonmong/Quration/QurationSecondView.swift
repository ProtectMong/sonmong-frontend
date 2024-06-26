//
//  QurationSecondView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationSecondView: UIView {
    
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
        label.backgroundColor = Constant.Color.m1
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
        label.text = "현재 증상을\n선택해 주세요"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "자세할수록 정확도가 올라갑니다."
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painLevelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아픈 정도를 선택해 주세요."
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painLevelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13
        view.layer.borderWidth = 1
        view.layer.borderColor = Constant.Color.g1.cgColor
        
        return view
    }()
    
    let painLevelTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = Constant.Color.g5
        
        return label
    }()
    
    let painLevelSlider: SliderView = {
        let slider = SliderView(maxValue: 11)
        slider.currentValue = 0
        
        return slider
    }()
    
    let painStartWhenTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "언제부터 아팠나요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let painStartWhenTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Constant.Color.g1.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = ""
        textField.textColor = Constant.Color.g5
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 15))
        let icon = UIImageView(frame: CGRect(x: 15, y: 0, width: 15, height: 15))
        icon.image = UIImage(named: "calendar_ic")
        icon.tintColor = .black
        outerView.addSubview(icon)
        
        textField.leftView = outerView
        textField.leftViewMode = .always
        
        return textField
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
        
        contentView.addSubview(painLevelTitle)
        painLevelTitle.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(painLevelView)
        painLevelView.snp.makeConstraints { make in
            make.top.equalTo(painLevelTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
        }
        
        painLevelView.addSubview(painLevelTextLabel)
        painLevelTextLabel.snp.makeConstraints { make in
            make.top.equalTo(painLevelView.snp.top).offset(18)
            make.centerX.equalTo(painLevelView.snp.centerX)
        }
        
        painLevelView.addSubview(painLevelSlider)
        painLevelSlider.snp.makeConstraints { make in
            make.top.equalTo(painLevelTextLabel.snp.bottom).offset(18)
            make.leading.equalTo(painLevelView.snp.leading).offset(15)
            make.trailing.equalTo(painLevelView.snp.trailing).offset(-15)
            make.bottom.equalTo(painLevelView.snp.bottom).offset(-18)
            make.height.equalTo(25)
        }
        
        contentView.addSubview(painStartWhenTitle)
        painStartWhenTitle.snp.makeConstraints { make in
            make.top.equalTo(painLevelView.snp.bottom).offset(40)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            
        }
        
        contentView.addSubview(painStartWhenTextField)
        painStartWhenTextField.snp.makeConstraints { make in
            make.top.equalTo(painStartWhenTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(48)
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
