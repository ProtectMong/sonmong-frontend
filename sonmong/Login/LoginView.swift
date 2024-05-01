//
//  LoginView.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
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
    
    let mainIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "login_main_logo")
        
        return view
    }()
    
    let subIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "login_sub_logo")
        
        return view
    }()
    
    let loginMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임/전화번호를\n입력해주세요."
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = Constant.Color.f1
        label.numberOfLines = 0
        return label
    }()
    
    let loginStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        
        return view
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "이름을 입력하세요"
        textField.backgroundColor = Constant.Color.f1
        textField.layer.borderColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "전화번호를 입력하세요."
        textField.backgroundColor = Constant.Color.f1
        textField.layer.borderColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = Constant.Color.g2
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let textButtonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.spacing = 10
        
        return view
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.backgroundColor = UIColor.clear
        return button
    }()
    
    let firstSeparateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00)
        return view
    }()
    
    let findIdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    let secondSeparateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00)
        
        return view
    }()
    
    let resetPwdButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("비밀번호 재설정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    let mainDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손목 헬스케어 앱"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Constant.Color.f1
        label.textAlignment = .center
        
        return label
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.m7
        
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
        
        contentView.addSubview(mainIconImageView)
        mainIconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(120)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(75)
        }
        
        contentView.addSubview(subIconImageView)
        subIconImageView.snp.makeConstraints { make in
            make.top.equalTo(mainIconImageView.snp.bottom).offset(13)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(95)
            make.height.equalTo(24)
        }
        
        contentView.addSubview(loginMessageLabel)
        loginMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(subIconImageView.snp.bottom).offset(80)
            make.leading.equalTo(22)
        }
        
        contentView.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(loginMessageLabel.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
        }
        
        loginStackView.addArrangedSubview(nameTextField)
        loginStackView.setCustomSpacing(15, after: nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        loginStackView.addArrangedSubview(phoneNumberTextField)
        loginStackView.setCustomSpacing(30, after: phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        loginStackView.addArrangedSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
        
//        contentView.addSubview(textButtonStackView)
//        textButtonStackView.snp.makeConstraints { make in
//            make.top.equalTo(loginStackView.snp.bottom).offset(20)
//            make.centerX.equalTo(contentView.snp.centerX)
//            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
//            make.height.equalTo(20)
//        }
//        
//        [registerButton, firstSeparateView, findIdButton, secondSeparateView, resetPwdButton].forEach {
//            textButtonStackView.addArrangedSubview($0)
//        }
//
//        firstSeparateView.snp.makeConstraints { make in
//            make.top.equalTo(textButtonStackView.snp.top).offset(3)
//            make.bottom.equalTo(textButtonStackView.snp.bottom).offset(-3)
//            make.width.equalTo(1)
//        }
//
//        secondSeparateView.snp.makeConstraints { make in
//            make.top.equalTo(textButtonStackView.snp.top).offset(3)
//            make.bottom.equalTo(textButtonStackView.snp.bottom).offset(-3)
//            make.width.equalTo(1)
//        }
        
        contentView.addSubview(mainDescriptionLabel)
        mainDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(loginStackView.snp.bottom).offset(150)
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
    }
    
}
