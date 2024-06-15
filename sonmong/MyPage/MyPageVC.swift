//
//  MyPageVC.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import Foundation
import UIKit
import RxSwift
import ReactorKit

class MyPageVC: UIViewController, View {
    var disposeBag = DisposeBag()
    let baseView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    func bind(reactor: MyPageReactor) {
        baseView.layout(superView: self.view)
        
        reactor.state.map { $0.isLoginStatus }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .map { _ in "의료 전문 AI와 함께하는\n통증 문답 서비스를 함께해요!" }
            .bind(to: baseView.userNameWithHelloLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.userName }
            .distinctUntilChanged()
            .filterNil()
            .map { "\($0)님 안녕하세요!" }
            .bind(to: baseView.userNameWithHelloLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.userPhoneNumber }
            .distinctUntilChanged()
            .filterNil()
            .map { $0.formatPhoneNumber() }
            .bind(to: baseView.userEmailLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.manageAccountTableViewDataSource }
            .filterNil()
            .bind(to: baseView.manageAccountTableView.rx.items(cellIdentifier: "MypageListCell", cellType: MypageListCell.self)) { row, data, cell in
                cell.titleLabel.text = data.title
                cell.iconImageView.image = UIImage(named: data.iconName ?? "")
            }
            .disposed(by: disposeBag)
        
        baseView.manageAccountTableView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.manageAccountTableView.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
        baseView.manageAccountTableView.rx.modelSelected(MyPageServies.self)
            .map { Reactor.Action.didManageAccontSelected($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.termAndPoliciesTableViewDataSource }
            .filterNil()
            .bind(to: baseView.termAndPoliciesTableView.rx.items(cellIdentifier: "MypageListCell", cellType: MypageListCell.self)) { row, data, cell in
                cell.titleLabel.text = data.title
                cell.iconImageView.image = UIImage(named: data.iconName ?? "")
            }
            .disposed(by: disposeBag)
        
        baseView.termAndPoliciesTableView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.termAndPoliciesTableView.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
        baseView.termAndPoliciesTableView.rx.modelSelected(MyPageServies.self)
            .map { Reactor.Action.didTermAndPolicySelected($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentLogOutAlert }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let alert = UIAlertController(title: "", message: "로그아웃하시겠습니까?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    reactor.action.onNext(.didLogOutAlertConfirmButtonTapped)
                }))
                
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentWithdrawalAlert }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let alert = UIAlertController(title: "", message: "정말 탈퇴하시겠습니까?\n기존 데이터는 3개월 보관 후 삭제됩니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    reactor.action.onNext(.didWithdrawAlertConfirmButtonTapped)
                }))
                
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentLoginVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let loginVC = LoginVC(reactor: LoginReactor())
                
                // SceneDelegate에서 rootViewController를 변경하는 방법
                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                   let window = sceneDelegate.window {
                    let navigationController = UINavigationController(rootViewController: loginVC)
                    window.rootViewController = navigationController
                    window.makeKeyAndVisible()
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentPrivacyPolicyVC }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let privacyVC = PrivacyPolicyVC()
                let privacyReactor = PrivacyPolicyReactor()
                privacyVC.reactor = privacyReactor
                
                vc.navigationController?.pushViewController(privacyVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentTermsOfServiceVC }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let termOfServiceVC = TermsOfServiceVC()
                let termOfServiceReactor = TermsOfServiceReactor()
                termOfServiceVC.reactor = termOfServiceReactor
                
                vc.navigationController?.pushViewController(termOfServiceVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    init(reactor: MyPageReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindNavigation() {
        let titleLabel = UILabel()
        titleLabel.text = "마이"
        titleLabel.textColor = Constant.Color.g5
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftItem
    }
}
