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
    let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
    let iconButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
    
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
        view.image = UIImage(named: "sonmong")
        
        return view
    }()
    
    let mainIconDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손몽이를 지켜줘!"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .center
        
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
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아이디를 입력하세요"
        textField.layer.borderColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let idSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디는 이메일형식입니다."
        label.textColor = UIColor(red: 0.91, green: 0.24, blue: 0.31, alpha: 1.00)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.isHidden = true
        
        return label
    }()
    
    let pwdTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호를 입력하세요."
        textField.layer.borderColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = margin
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let pwdSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호를 입력해주세요."
        label.textColor = UIColor(red: 0.91, green: 0.24, blue: 0.31, alpha: 1.00)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.isHidden = true
        
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 5
        
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
    
    func layout(superView: UIView) {
        superView.backgroundColor = .white
        
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
        
//        self.addSubview(contentView)
//        contentView.snp.makeConstraints { make in
//            make.top.equalTo(self.snp.top)
//            make.leading.equalTo(self.snp.leading)
//            make.trailing.equalTo(self.snp.trailing)
//            make.bottom.equalTo(self.snp.bottom)
//        }
        
        contentView.addSubview(mainIconImageView)
        mainIconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(120)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(72)
            make.height.equalTo(41)
        }
        
        contentView.addSubview(mainIconDescriptionLabel)
        mainIconDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(mainIconImageView.snp.bottom).offset(13)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(15)
        }
        
        contentView.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(mainIconDescriptionLabel.snp.bottom).offset(100)
            make.leading.equalTo(contentView.snp.leading).offset(25)
            make.trailing.equalTo(contentView.snp.trailing).offset(-25)
        }
        
        loginStackView.addArrangedSubview(idTextField)
        loginStackView.setCustomSpacing(5, after: idTextField)
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        loginStackView.addArrangedSubview(idSubTitleLabel)
        loginStackView.setCustomSpacing(10, after: idSubTitleLabel)
        
        loginStackView.addArrangedSubview(pwdTextField)
        loginStackView.setCustomSpacing(5, after: pwdTextField)
        pwdTextField.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        loginStackView.addArrangedSubview(pwdSubTitleLabel)
        loginStackView.setCustomSpacing(10, after: pwdSubTitleLabel)
        loginStackView.addArrangedSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
        
        iconButton.setImage(UIImage(named: "ic_eye_on"), for: .normal)
        iconButton.contentMode = .left
        iconButton.tintColor = .black
        iconButton.isHidden = true
        outerView.addSubview(iconButton)
        pwdTextField.rightView = outerView
        pwdTextField.rightViewMode = .always
        
        contentView.addSubview(textButtonStackView)
        textButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(loginStackView.snp.bottom).offset(20)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
            make.height.equalTo(20)
        }
        
        [registerButton, firstSeparateView, findIdButton, secondSeparateView, resetPwdButton].forEach {
            textButtonStackView.addArrangedSubview($0)
        }

        firstSeparateView.snp.makeConstraints { make in
            make.top.equalTo(textButtonStackView.snp.top).offset(3)
            make.bottom.equalTo(textButtonStackView.snp.bottom).offset(-3)
            make.width.equalTo(1)
        }

        secondSeparateView.snp.makeConstraints { make in
            make.top.equalTo(textButtonStackView.snp.top).offset(3)
            make.bottom.equalTo(textButtonStackView.snp.bottom).offset(-3)
            make.width.equalTo(1)
        }
    }
    
}
