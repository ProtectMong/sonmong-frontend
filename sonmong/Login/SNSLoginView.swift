//
//  SNSLoginView.swift
//  sonmong
//
//  Created by 이은솔 on 6/2/24.
//

import Foundation
import UIKit
import SnapKit

class SNSLoginView: UIView {
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
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.text = "전문 AI와 함께하는"
        label.textColor = Constant.Color.g5
        return label
    }()
    
    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.text = "통증 문답 서비스"
        label.textColor = Constant.Color.m7
        return label
    }()
    
    let mainIconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sns_login_logo")
        
        return view
    }()
    
    let snsLoginTitleStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillEqually
        
        return view
    }()
    
    let leftHorizonLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.g1
        return view
    }()
    
    let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "로그인/회원가입"
        label.textColor = Constant.Color.g3
        label.backgroundColor = Constant.Color.f2
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let rightHorizonLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.g1
        return view
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 11
        button.setImage(UIImage(named: "kakao_login_button"), for: .normal)
        return button
    }()
    
    let naverLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 11
        button.setImage(UIImage(named: "naver_login_Button"), for: .normal)
        return button
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 11
        button.setImage(UIImage(named: "apple_login_Button"), for: .normal)
        return button
    }()
    
    let googleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 11
        button.setImage(UIImage(named: "google_login_Button"), for: .normal)
        return button
    }()
    
    let registerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "로그인하시면 아래 내용에 동의하시는 것으로 간주됩니다."
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = Constant.Color.g4
        label.textAlignment = .center
        
        
        return label
    }()
    
    let privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let title = "개인정보처리방침"
        let attributedString = NSAttributedString(
            string: title,
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                         .font: UIFont.systemFont(ofSize: 11)]
        )
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(Constant.Color.g4, for: .normal)
        
        return button
    }()
    
    let termsOfUseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let title = "이용약관"
        let attributedString = NSAttributedString(
            string: title,
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                         .font: UIFont.systemFont(ofSize: 11)]
        )
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(Constant.Color.g4, for: .normal)
        
        return button
    }()

    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.f2
        
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
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(80)
            make.leading.equalTo(contentView.snp.leading).offset(116)
            make.trailing.equalTo(contentView.snp.trailing).offset(-116)
        }
        
        contentView.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(105)
            make.trailing.equalTo(contentView.snp.trailing).offset(-105)
        }
        
        contentView.addSubview(mainIconImageView)
        mainIconImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(25)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        contentView.addSubview(leftHorizonLineView)
        leftHorizonLineView.snp.makeConstraints { make in
            make.top.equalTo(mainIconImageView.snp.bottom).offset(60)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(1)
        }
        
        contentView.addSubview(loginTitleLabel)
        loginTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(leftHorizonLineView.snp.centerY)
        }
        
        contentView.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(loginTitleLabel.snp.bottom).offset(25)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(53)
        }
        
        contentView.addSubview(naverLoginButton)
        naverLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(53)
        }
        
        contentView.addSubview(appleLoginButton)
        appleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(naverLoginButton.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(53)
        }
        
        contentView.addSubview(googleLoginButton)
        googleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(appleLoginButton.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
            make.height.equalTo(53)
        }
        
        contentView.addSubview(registerDescriptionLabel)
        registerDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(googleLoginButton.snp.bottom).offset(37)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
        }
        
        contentView.addSubview(privacyPolicyButton)
        privacyPolicyButton.snp.makeConstraints { make in
            make.top.equalTo(registerDescriptionLabel.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(120)
            make.bottom.equalTo(contentView.snp.bottom).offset(-30)
            make.width.equalTo(77)
            make.height.equalTo(14)
        }
        
        contentView.addSubview(termsOfUseButton)
        termsOfUseButton.snp.makeConstraints { make in
            make.top.equalTo(registerDescriptionLabel.snp.bottom).offset(15)
            make.leading.equalTo(privacyPolicyButton.snp.trailing).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-30)
            make.width.equalTo(39)
            make.height.equalTo(14)
        }
    }
}
