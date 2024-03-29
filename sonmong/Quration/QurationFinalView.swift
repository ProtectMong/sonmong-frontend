//
//  QurationFinalView.swift
//  sonmong
//
//  Created by 이은솔 on 3/29/24.
//

import Foundation
import UIKit
import SnapKit

class QurationFinalView: UIView {
    
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
    
    let userInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.Color.m5
        label.text = "환자 정보"
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        
        return label
    }()
    
    let userInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = Constant.Color.f1
        view.isUserInteractionEnabled = true
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.80
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 11.0
        
        return view
    }()
    
    let painGradeTitleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손뭉이님의 통증점수 10점"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 나이: 만 26세"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let jobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 직업: 프로그래머"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let painLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 증상: 오른쪽 손목 새끼손가락 통증"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let periodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 발병 기간: 7일"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let reasonBadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 악화요인: 코딩작업"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let pastPainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "• 과거 병력: 손목 및 관절 수술 경험 없음"
        label.textColor = Constant.Color.b1
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let detailSectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        
        return view
    }()
    
    let detailTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = Constant.Color.m5
        label.text = "상담 분석 결과 내용"
        
        return label
    }()
    
    let detailDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.g4
        label.text = "24.03.29"
        
        return label
    }()
    
    let detailPainReasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = Constant.Color.m5
        label.text = "상담 분석 결과 내용"
        
        return label
    }()
    
    let detailTitleAndContentsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        
        return view
    }()
    
    let recommendSectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        
        return view
    }()
    
    let recommendTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = Constant.Color.m5
        label.text = "추천 영상"
        
        return label
    }()
    
    let sampleImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 13
        
        return view
    }()
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "영상제목"
        
        return label
    }()
    
    let shareSectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        
        return view
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("공유하기", for: .normal)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.backgroundColor = Constant.Color.m2
        button.layer.cornerRadius = 15
        button.layer.shadowColor = Constant.Color.b1.cgColor
        button.layer.shadowOpacity = 0.10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4.0

        return button
    }()
    
    func layout(superView: UIView) {
        superView.backgroundColor = Constant.Color.f2
        self.backgroundColor = Constant.Color.f2
        
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
        
        contentView.addSubview(userInfoTitleLabel)
        userInfoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(22)
        }
        
        contentView.addSubview(userInfoView)
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(userInfoTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(contentView.snp.leading).offset(22)
            make.trailing.equalTo(contentView.snp.trailing).offset(-22)
        }
        
        userInfoView.addSubview(painGradeTitleLable)
        painGradeTitleLable.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.top).offset(22)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(painGradeTitleLable.snp.bottom).offset(14)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(painLabel)
        painLabel.snp.makeConstraints { make in
            make.top.equalTo(jobLabel.snp.bottom).offset(10)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(periodLabel)
        periodLabel.snp.makeConstraints { make in
            make.top.equalTo(painLabel.snp.bottom).offset(10)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(reasonBadLabel)
        reasonBadLabel.snp.makeConstraints { make in
            make.top.equalTo(periodLabel.snp.bottom).offset(10)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
        }
        
        userInfoView.addSubview(pastPainLabel)
        pastPainLabel.snp.makeConstraints { make in
            make.top.equalTo(reasonBadLabel.snp.bottom).offset(10)
            make.leading.equalTo(userInfoView.snp.leading).offset(19)
            make.bottom.equalTo(userInfoView.snp.bottom).offset(-20)
        }
        
        contentView.addSubview(detailSectionView)
        detailSectionView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        detailSectionView.addSubview(detailTitleLabel)
        detailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(detailSectionView.snp.top).offset(28)
            make.leading.equalTo(detailSectionView.snp.leading).offset(22)
        }
        
        detailSectionView.addSubview(detailDateLabel)
        detailDateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(detailTitleLabel.snp.bottom)
            make.trailing.equalTo(detailSectionView.snp.trailing).offset(-22)
        }
        
        detailSectionView.addSubview(detailTitleAndContentsStackView)
        detailTitleAndContentsStackView.snp.makeConstraints { make in
            make.top.equalTo(detailTitleLabel.snp.bottom).offset(40)
            make.leading.equalTo(detailSectionView.snp.leading).offset(22)
            make.trailing.equalTo(detailSectionView.snp.trailing).offset(-22)
            make.bottom.equalTo(detailSectionView.snp.bottom).offset(-40)
            make.height.equalTo(600)
        }
        
        contentView.addSubview(recommendSectionView)
        recommendSectionView.snp.makeConstraints { make in
            make.top.equalTo(detailSectionView.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        recommendSectionView.addSubview(recommendTitleLabel)
        recommendTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(recommendSectionView.snp.top).offset(30)
            make.leading.equalTo(recommendSectionView.snp.leading).offset(22)
        }
        
        recommendSectionView.addSubview(sampleImageView)
        sampleImageView.snp.makeConstraints { make in
            make.top.equalTo(recommendTitleLabel.snp.bottom).offset(20)
            make.leading.equalTo(recommendSectionView.snp.leading).offset(22)
            make.trailing.equalTo(recommendSectionView.snp.trailing).offset(-22)
            make.height.equalTo(140)
        }
        
        recommendSectionView.addSubview(videoTitleLabel)
        videoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sampleImageView.snp.bottom).offset(20)
            make.leading.equalTo(recommendSectionView.snp.leading).offset(22)
            make.bottom.equalTo(recommendSectionView.snp.bottom).offset(-55)
        }
        
        contentView.addSubview(shareSectionView)
        shareSectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendSectionView.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
        shareSectionView.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(shareSectionView.snp.top).offset(10)
            make.leading.equalTo(shareSectionView.snp.leading).offset(22)
            make.trailing.equalTo(shareSectionView.snp.trailing).offset(-22)
            make.bottom.equalTo(shareSectionView.snp.bottom).offset(-10)
            make.height.equalTo(57)
        }
    }
}
