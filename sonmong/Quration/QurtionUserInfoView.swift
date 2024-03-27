//
//  QurationUserInfoView.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import SnapKit

class QurationUserInfoView: UIView {
    
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
        label.backgroundColor = Constant.Color.m1
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
        label.text = "인적 사항을\n선택해 주세요"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "통증에 관련해서 더 정확한 검사가 진행됩니다."
        label.textColor = Constant.Color.g3
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let birthdayTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "태어난 날을 알려주세요."
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Constant.Color.g1.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "yyyy.MM.dd"
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
    
    let genderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "성별을 알려주세요."
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let genderStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        
        return view
    }()
    
    let genderGirlButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("여자", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let genderBoyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("남자", for: .normal)
        button.setTitleColor(Constant.Color.b1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.Color.g1.cgColor
        
        return button
    }()
    
    let jobOrHobbyTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "귀하의 직업이나 취미활동은 무엇인가요?"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    let jobOrHobbyCollectionView: UICollectionView = {
        let layout = CollectionViewCellLeftAlignFlowLayout()
        layout.estimatedItemSize = CollectionViewCellLeftAlignFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets.zero

        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(QurationSelectionStyleCell.self, forCellWithReuseIdentifier: "QurationSelectionStyleCell")
        collection.isScrollEnabled = false
        collection.contentInset = UIEdgeInsets.zero

        return collection
    }()
    
    let jobOrHobbyUserInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "직접 입력해 주세요."
        textField.layer.borderColor = Constant.Color.g1.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textColor = Constant.Color.g5
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let jobOrHobbyUserInputButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("등록", for: .normal)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.backgroundColor = Constant.Color.g2
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let stepButtonLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.l3
        
        return view
    }()
    
    let stepButtonBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f2
        
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
        button.backgroundColor = Constant.Color.f1
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
    
//    var isEnabled: Bool {
//            didSet {
//                nextButton.backgroundColor = isEnabled ? Constant.Color.m7 : Constant.Color.g4
//            }
//        }
    
    func layout(superView: UIView) {
        superView.backgroundColor = .white
        
        superView.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(superView.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(superView.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superView.snp.bottom)
        }
        
        self.addSubview(stepButtonBaseView)
        stepButtonBaseView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(99)
        }
        
        stepButtonBaseView.addSubview(stepButtonStackView)
        stepButtonStackView.snp.makeConstraints { make in            make.top.equalTo(stepButtonBaseView.snp.top).offset(10)
            make.leading.equalTo(stepButtonBaseView.snp.leading).offset(6)
            make.trailing.equalTo(stepButtonBaseView.snp.trailing).offset(-6)
            make.height.equalTo(46)
        }
        
        [previousButton, nextButton].forEach {
            stepButtonStackView.addArrangedSubview($0)
        }
        
        stepButtonBaseView.addSubview(stepButtonLineView)
        stepButtonLineView.snp.makeConstraints { make in
            make.top.equalTo(stepButtonBaseView.snp.top)
            make.trailing.equalTo(stepButtonBaseView.snp.trailing)
            make.leading.equalTo(stepButtonBaseView.snp.leading)
            make.height.equalTo(1)
        }
        
        self.addSubview(baseScrollView)
        baseScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(stepButtonLineView.snp.top)
        }
        
        baseScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(baseScrollView.snp.top)
            make.leading.equalTo(baseScrollView.snp.leading)
            make.trailing.equalTo(baseScrollView.snp.trailing)
            make.bottom.equalTo(baseScrollView.snp.bottom)
            make.width.equalTo(baseScrollView.snp.width)
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
        
        contentView.addSubview(birthdayTitleLabel)
        birthdayTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(35)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(birthdayTextField)
        birthdayTextField.snp.makeConstraints { make in
            make.top.equalTo(birthdayTitleLabel.snp.bottom).offset(13)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(48)
        }
        
        contentView.addSubview(genderTitleLabel)
        genderTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(birthdayTextField.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(genderStackView)
        genderStackView.snp.makeConstraints { make in
            make.top.equalTo(genderTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(46)
        }
        
        [genderGirlButton, genderBoyButton].forEach {
            genderStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(jobOrHobbyTitle)
        jobOrHobbyTitle.snp.makeConstraints { make in
            make.top.equalTo(genderStackView.snp.bottom).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(jobOrHobbyCollectionView)
        jobOrHobbyCollectionView.snp.makeConstraints { make in
            make.top.equalTo(jobOrHobbyTitle.snp.bottom).offset(18)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(0)
        }
        
        contentView.addSubview(jobOrHobbyUserInputButton)
        jobOrHobbyUserInputButton.snp.makeConstraints { make in
            make.top.equalTo(jobOrHobbyCollectionView.snp.bottom).offset(0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.width.equalTo(84)
            make.height.equalTo(46)
        }
        
        contentView.addSubview(jobOrHobbyUserInputTextField)
        jobOrHobbyUserInputTextField.snp.makeConstraints { make in
            make.top.equalTo(jobOrHobbyUserInputButton.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(jobOrHobbyUserInputButton.snp.leading).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(46)
        }
        
    }
}

