//
//  HomeView.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/26.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
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
    
    let topBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        
        return view
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손몽이님!\n오늘의 손목 건강은 어떠신가요?"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = Constant.Color.g7
        label.numberOfLines = 0
        
        return label
    }()
    
    let aiButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.m7
        view.layer.cornerRadius = 13
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 6.0
        
        return view
    }()
    
    let aiTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손목이 아프다면\n실시간 AI 상담"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = Constant.Color.f1
        label.numberOfLines = 0
        
        return label
    }()
    
    let aiImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "historyInfo_icon")
        
        return view
    }()
    
    let aiSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "상담하러가기"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.f1
        
        return label
    }()
        
    let aiButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    let sonmongButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.m2
        view.layer.cornerRadius = 13
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 6.0
        
        return view
    }()
    
    let sonmongTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손몽이를\n지켜줘"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = Constant.Color.f1
        label.numberOfLines = 0
        
        return label
    }()
    
    let sonmongImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "home_sonmong")
        
        return view
    }()
    
    let sonmongSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손몽이 키우러 가기"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.f1
        
        return label
    }()
    
    let sonmongButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    let recommendBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f2
        
        return view
    }()
    
    let todaysRecommendTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "오늘의 손목 추천 운동"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = Constant.Color.g7
        
        return label
    }()
    
    let todaysRecommendGoDetailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.isUserInteractionEnabled = true
        button.setTitle("자세히보기", for: .normal)
        button.setImage(UIImage(named: "chevron-forward-outline"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(Constant.Color.g3, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        let spacing: CGFloat = -5
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        
        return button
    }()
    
    let recommandView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.f1
        view.layer.cornerRadius = 13
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 8.0
        
        return view
    }()
    
    let youtubeThumbnailImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 94/2
        view.clipsToBounds = true
        view.backgroundColor = UIColor.lightGray
        view.isUserInteractionEnabled = true
        view.layer.shadowColor = Constant.Color.b1.cgColor
        view.layer.shadowOpacity = 0.80
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 11.0
        
        return view
    }()
    
    let youtubePlayButtonButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "player_play_ic"), for: .normal)
        
        return button
    }()
    
    let youtubeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "손목 터널증후군 스트레칭"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = Constant.Color.g6
        
        return label
    }()
    
    let youtubeInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "엄지사용 근육이완, 1분"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Constant.Color.g4
        return label
    }()
    
    let youtubeFirstTagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = Constant.Color.f2
        view.layer.borderColor = Constant.Color.g1.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let youtubeFirstTagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "하루 2번"
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = Constant.Color.g5
        
        return label
    }()
    
    let youtubeSecondTagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = Constant.Color.f2
        view.layer.borderColor = Constant.Color.g1.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let youtubeSecondTagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "일상 스트레칭"
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = Constant.Color.g5
        
        return label
    }()
    
    let qurationBaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constant.Color.m7_mate
        
        return view
    }()
    
    let qurationListTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "몽이님의 상담기록"
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.textColor = Constant.Color.g7
        
        return label
    }()
    
    let qurationListGoDetailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.isUserInteractionEnabled = true
        button.setTitle("자세히보기", for: .normal)
        button.setImage(UIImage(named: "chevron-forward-outline"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(Constant.Color.g3, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        let spacing: CGFloat = -5
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        
        return button
    }()
    
    let qurationListTable: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(QurationHistoryTableViewCell.self, forCellReuseIdentifier: "QurationHistoryTableViewCell")
        view.separatorStyle = .none
        view.backgroundColor = UIColor.clear
//        view.isHidden = true
        
        return view
    }()
    
    let goToQurationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constant.Color.m7
        button.setTitle("상담 받으러 가기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(Constant.Color.f1, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = Constant.Color.b1.cgColor
        button.layer.shadowOpacity = 0.10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 4.0
        
        return button
    }()
    
    let noDataStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.isHidden = true
        
        return view
    }()
    
    let noDataImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sad-outline")
        
        return view
    }()
    
    let noDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아직 상담 기록이 없네요.\n상담을 받아보세요!"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = Constant.Color.g2
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
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
        
        contentView.addSubview(topBaseView)
        topBaseView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        topBaseView.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(topBaseView.snp.top).offset(25)
            make.leading.equalTo(topBaseView.snp.leading).offset(22)
        }
        
        topBaseView.addSubview(aiButtonView)
        aiButtonView.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(15)
            make.leading.equalTo(topBaseView.snp.leading).offset(22)
            make.trailing.equalTo(topBaseView.snp.centerX).offset(-5)
            make.bottom.equalTo(topBaseView.snp.bottom).offset(-23)
            make.height.equalTo(160)
        }
        
        aiButtonView.addSubview(aiImageView)
        aiImageView.snp.makeConstraints { make in
            make.bottom.equalTo(aiButtonView.snp.bottom).offset(-40)
            make.trailing.equalTo(aiButtonView.snp.trailing).offset(-5)
            make.width.equalTo(79)
            make.height.equalTo(55)
        }
        
        aiButtonView.addSubview(aiTitleLabel)
        aiTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(aiButtonView.snp.top).offset(28)
            make.leading.equalTo(aiButtonView.snp.leading).offset(18)
        }
        
        aiButtonView.addSubview(aiSubTitleLabel)
        aiSubTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(aiButtonView.snp.leading).offset(18)
            make.bottom.equalTo(aiButtonView.snp.bottom).offset(-22)
        }
        
        topBaseView.addSubview(aiButton)
        aiButton.snp.makeConstraints { make in
            make.edges.equalTo(aiButtonView.snp.edges)
        }
        
        topBaseView.addSubview(sonmongButtonView)
        sonmongButtonView.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(15)
            make.leading.equalTo(topBaseView.snp.centerX).offset(5)
            make.trailing.equalTo(topBaseView.snp.trailing).offset(-22)
            make.bottom.equalTo(topBaseView.snp.bottom).offset(-23)
            make.height.equalTo(160)
        }
        
        sonmongButtonView.addSubview(sonmongImageView)
        sonmongImageView.snp.makeConstraints { make in
            make.bottom.equalTo(sonmongButtonView.snp.bottom).offset(-13)
            make.trailing.equalTo(sonmongButtonView.snp.trailing)
            make.width.equalTo(68)
            make.height.equalTo(120)
        }
        
        sonmongButtonView.addSubview(sonmongTitleLabel)
        sonmongTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sonmongButtonView.snp.top).offset(28)
            make.leading.equalTo(sonmongButtonView.snp.leading).offset(18)
        }
        
        sonmongButtonView.addSubview(sonmongSubTitleLabel)
        sonmongSubTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(sonmongButtonView.snp.leading).offset(18)
            make.bottom.equalTo(sonmongButtonView.snp.bottom).offset(-22)
        }
        
        topBaseView.addSubview(sonmongButton)
        sonmongButton.snp.makeConstraints { make in
            make.edges.equalTo(sonmongButtonView.snp.edges)
        }
        
        contentView.addSubview(recommendBaseView)
        recommendBaseView.snp.makeConstraints { make in
            make.top.equalTo(topBaseView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        recommendBaseView.addSubview(todaysRecommendGoDetailButton)
        todaysRecommendGoDetailButton.snp.makeConstraints { make in
            make.top.equalTo(recommendBaseView.snp.top).offset(37)
            make.trailing.lessThanOrEqualTo(recommendBaseView.snp.trailing).offset(-22)
        }
        
        recommendBaseView.addSubview(todaysRecommendTitleLabel)
        todaysRecommendTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(todaysRecommendGoDetailButton.snp.bottom)
            make.leading.equalTo(recommendBaseView.snp.leading).offset(22)
        }
        
        recommendBaseView.addSubview(recommandView)
        recommandView.snp.makeConstraints { make in
            make.top.equalTo(todaysRecommendTitleLabel.snp.bottom).offset(15)
            make.leading.equalTo(recommendBaseView.snp.leading).offset(22)
            make.trailing.equalTo(recommendBaseView.snp.trailing).offset(-22)
            make.bottom.equalTo(recommendBaseView.snp.bottom).offset(-25)
        }
        
        recommandView.addSubview(youtubeThumbnailImageView)
        youtubeThumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(recommandView.snp.top).offset(27.5)
            make.leading.equalTo(recommandView.snp.leading).offset(17)
            make.bottom.equalTo(recommandView.snp.bottom).offset(-27.5)
            make.width.equalTo(94)
            make.height.equalTo(94)
        }
        
        youtubeThumbnailImageView.addSubview(youtubePlayButtonButton)
        youtubePlayButtonButton.snp.makeConstraints { make in
            make.centerX.equalTo(youtubeThumbnailImageView.snp.centerX)
            make.centerY.equalTo(youtubeThumbnailImageView.snp.centerY)
        }
        
        recommandView.addSubview(youtubeTitleLabel)
        youtubeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(recommandView.snp.top).offset(33)
            make.leading.equalTo(youtubeThumbnailImageView.snp.trailing).offset(17)
            make.trailing.equalTo(recommandView.snp.trailing).offset(-17)
        }
        
        recommandView.addSubview(youtubeInfoLabel)
        youtubeInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(youtubeTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(youtubeTitleLabel.snp.leading)
        }
        
        recommandView.addSubview(youtubeFirstTagView)
        youtubeFirstTagView.snp.makeConstraints { make in
            make.bottom.equalTo(youtubeThumbnailImageView.snp.bottom)
            make.leading.equalTo(youtubeTitleLabel.snp.leading)
        }
        
        youtubeFirstTagView.addSubview(youtubeFirstTagLabel)
        youtubeFirstTagLabel.snp.makeConstraints { make in
            make.top.equalTo(youtubeFirstTagView.snp.top).offset(3.5)
            make.leading.equalTo(youtubeFirstTagView.snp.leading).offset(10)
            make.trailing.equalTo(youtubeFirstTagView.snp.trailing).offset(-10)
            make.bottom.equalTo(youtubeFirstTagView.snp.bottom).offset(-3.5)
        }
        
        recommandView.addSubview(youtubeSecondTagView)
        youtubeSecondTagView.snp.makeConstraints { make in
            make.bottom.equalTo(youtubeFirstTagView.snp.bottom)
            make.leading.equalTo(youtubeFirstTagView.snp.trailing).offset(7)
        }
        
        youtubeSecondTagView.addSubview(youtubeSecondTagLabel)
        youtubeSecondTagLabel.snp.makeConstraints { make in
            make.top.equalTo(youtubeSecondTagView.snp.top).offset(3.5)
            make.leading.equalTo(youtubeSecondTagView.snp.leading).offset(10)
            make.trailing.equalTo(youtubeSecondTagView.snp.trailing).offset(-10)
            make.bottom.equalTo(youtubeSecondTagView.snp.bottom).offset(-3.5)
        }
        
        contentView.addSubview(qurationBaseView)
        qurationBaseView.snp.makeConstraints { make in
            make.top.equalTo(recommendBaseView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
        
        qurationBaseView.addSubview(qurationListGoDetailButton)
        qurationListGoDetailButton.snp.makeConstraints { make in
            make.top.equalTo(qurationBaseView.snp.top).offset(37)
            make.trailing.lessThanOrEqualTo(qurationBaseView.snp.trailing).offset(-22)
        }
        
        qurationBaseView.addSubview(qurationListTitleLabel)
        qurationListTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(qurationListGoDetailButton.snp.bottom)
            make.leading.equalTo(qurationBaseView.snp.leading).offset(22)
        }
        
        qurationBaseView.addSubview(qurationListTable)
        qurationListTable.snp.makeConstraints { make in
            make.top.equalTo(qurationListTitleLabel.snp.bottom).offset(15)
            make.leading.equalTo(qurationBaseView.snp.leading)
            make.trailing.equalTo(qurationBaseView.snp.trailing)
            make.height.equalTo(250)
        }
        
        [noDataImageView, noDataLabel].forEach {
            noDataStackView.addArrangedSubview($0)
        }
        
        qurationBaseView.addSubview(noDataStackView)
        noDataStackView.snp.makeConstraints { make in
            make.top.equalTo(qurationListTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(qurationBaseView.snp.centerX)
            make.height.equalTo(150)
        }
        
        noDataImageView.snp.makeConstraints { make in
            make.width.equalTo(96)
            make.height.equalTo(96)
        }
        
        qurationBaseView.addSubview(goToQurationButton)
        goToQurationButton.snp.makeConstraints { make in
            make.top.equalTo(qurationListTable.snp.bottom).offset(25)
            make.leading.equalTo(qurationBaseView.snp.leading).offset(22)
            make.trailing.equalTo(qurationBaseView.snp.trailing).offset(-22)
            make.height.equalTo(57)
            make.bottom.equalTo(qurationBaseView.snp.bottom).offset(-25)
        }
        
    }
}
