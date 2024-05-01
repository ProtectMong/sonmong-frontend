//
//  HomeVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit

class HomeVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = HomeView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    func bind(reactor: HomeReactor) {
        baseView.layout(superView: self.view)
        
        baseView.aiButton.rx.tap
            .map { Reactor.Action.didAIButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.sonmongButton.rx.tap
            .map { Reactor.Action.didSonmongButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.qurationListDatasource }
            .distinctUntilChanged()
            .filterNil()
            .take(3)
            .bind(to: baseView.qurationListTable.rx.items(cellIdentifier: "QurationHistoryTableViewCell", cellType: QurationHistoryTableViewCell.self)) { row, data, cell in
                cell.totalTitleLabel.text = data
            }
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isQurationListTableHidden }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.noDataStackView.isHidden = true
                vc.baseView.qurationListTable.isHidden = false
                vc.baseView.goToQurationButton.snp.remakeConstraints { make in
                    make.top.equalTo(vc.baseView.qurationListTable.snp.bottom).offset(25)
                    make.leading.equalTo(vc.baseView.qurationBaseView.snp.leading).offset(22)
                    make.trailing.equalTo(vc.baseView.qurationBaseView.snp.trailing).offset(-22)
                    make.height.equalTo(57)
                    make.bottom.equalTo(vc.baseView.qurationBaseView.snp.bottom).offset(-25)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isQurationListTableHidden }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.noDataStackView.isHidden = false
                vc.baseView.qurationListTable.isHidden = true
                vc.baseView.goToQurationButton.snp.remakeConstraints { make in
                    make.top.equalTo(vc.baseView.noDataStackView.snp.bottom).offset(25)
                    make.leading.equalTo(vc.baseView.qurationBaseView.snp.leading).offset(22)
                    make.trailing.equalTo(vc.baseView.qurationBaseView.snp.trailing).offset(-22)
                    make.height.equalTo(57)
                    make.bottom.equalTo(vc.baseView.qurationBaseView.snp.bottom).offset(-25)
                }
            })
            .disposed(by: disposeBag)
        
        baseView.qurationListTable.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.qurationListTable.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
        baseView.qurationListGoDetailButton.rx.tap
            .map { Reactor.Action.didQurationListGpDetailButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentQurationMainVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.tabBarController?.selectedIndex = 1
            })
            .disposed(by: disposeBag)
        
        baseView.goToQurationButton.rx.tap
            .map { Reactor.Action.didGoQurationButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentQurationUserInfoVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let qurationUserInfoVC = QurationUserInfoVC()
                let qurationUserInfoReactor = QurationUserInfoReactor()
                qurationUserInfoVC.reactor = qurationUserInfoReactor
                
                vc.navigationController?.pushViewController(qurationUserInfoVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentAlertMessage }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let alert = UIAlertController(title: "🫰", message: "손몽이 키우기는 준비중입니다!\n잠시만 기다려 주세요!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
    }
    
    
    init(reactor: HomeReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindNavigation() {
        // 로고 이미지를 위한 UIImageView 생성
        let logoImageView = UIImageView(image: UIImage(named: "nav_left_icon"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 22, y: 0, width: 30, height: 30) // 크기 조정
        
        // 커스텀 뷰를 버튼 아이템에 설정
        let logoItem = UIBarButtonItem(customView: logoImageView)
        
        // 네비게이션 아이템에 로고 아이템 추가
        self.navigationItem.leftBarButtonItem = logoItem
    }
}
