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
        
//        bindNavigation()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func bind(reactor: HomeReactor) {
        baseView.layout(superView: self.view)
        
        baseView.aiButton.rx.tap
            .map { Reactor.Action.didAIButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.sonmongButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext:{ vc, _ in
                let message = "손몽이 키우기는 아직 준비중이에요.\n조금만 기다려주세요!"
                let alert = UIAlertController(title: "🫰", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            })
        
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
        
    }
    
    
    init(reactor: HomeReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindNavigation() {
        self.title = "손몽이를 지켜줘!"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Constant.Color.f2
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .bold)
        ]
        
//        self.navigationController?.navigationBar.tintColor = Enti.Color.c000000
        
        let searchButtonItem = UIBarButtonItem(image: UIImage(named: "search_ic"),
                                                  style: .plain,
                                                  target: nil,
                                                  action: nil)
        
        searchButtonItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        searchButtonItem.tintColor = Constant.Color.b1
//        self.navigationItem.setRightBarButtonItems([searchButtonItem], animated: false)
//        
//        searchButtonItem.rx.tap
//            .subscribe(onNext: { _ in
//                #warning("검색 기능 구현")
//            }).disposed(by: disposeBag)
    }
}
