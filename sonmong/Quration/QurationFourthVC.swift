//
//  QurationFourthVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationFourthVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationFourthView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bind(reactor: QurationFourthReactor) {
        baseView.layout(superView: self.view)
        
        baseView.pastPainYesButton.rx.tap
            .map { Reactor.Action.didPastPainYesButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        baseView.pastPainNoButton.rx.tap
            .map { Reactor.Action.didPastPainNoButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.pastPain }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.pastPainYesButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.pastPainYesButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.pastPainYesButton.setTitleColor(Constant.Color.m7, for: .normal)
                
                vc.baseView.pastPainNoButton.backgroundColor = Constant.Color.f1
                vc.baseView.pastPainNoButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.pastPainNoButton.setTitleColor(Constant.Color.b1, for: .normal)
            })
            .disposed(by: disposeBag)

        reactor.state.map { $0.pastPain }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.pastPainYesButton.backgroundColor = Constant.Color.f1
                vc.baseView.pastPainYesButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.pastPainYesButton.setTitleColor(Constant.Color.b1, for: .normal)
                
                vc.baseView.pastPainNoButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.pastPainNoButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.pastPainNoButton.setTitleColor(Constant.Color.m7, for: .normal)
            })
            .disposed(by: disposeBag)
        
        baseView.pastMusclePainYesButton.rx.tap
            .map { Reactor.Action.didPastMusclePainYesButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.pastMusclePainNoButton.rx.tap
            .map { Reactor.Action.didPastMusclePainNoButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.pastMusclePain }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.pastMusclePainYesButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.pastMusclePainYesButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.pastMusclePainYesButton.setTitleColor(Constant.Color.m7, for: .normal)
                
                vc.baseView.pastMusclePainNoButton.backgroundColor = Constant.Color.f1
                vc.baseView.pastMusclePainNoButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.pastMusclePainNoButton.setTitleColor(Constant.Color.b1, for: .normal)
            })
            .disposed(by: disposeBag)

        reactor.state.map { $0.pastMusclePain }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.pastMusclePainYesButton.backgroundColor = Constant.Color.f1
                vc.baseView.pastMusclePainYesButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.pastMusclePainYesButton.setTitleColor(Constant.Color.b1, for: .normal)
                
                vc.baseView.pastMusclePainNoButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.pastMusclePainNoButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.pastMusclePainNoButton.setTitleColor(Constant.Color.m7, for: .normal)
            })
            .disposed(by: disposeBag)
        
        baseView.previousButton.rx.tap
            .map { Reactor.Action.didPreviousButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.nextButton.rx.tap
            .map { Reactor.Action.didNextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangePastPainError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.pastPainNoButton.layer.borderColor = Constant.Color.m1.cgColor
                vc.baseView.pastPainYesButton.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangePastMusclePainError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
                vc.baseView.pastMusclePainNoButton.layer.borderColor = Constant.Color.m1.cgColor
                vc.baseView.pastMusclePainYesButton.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isNextButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
                vc.baseView.nextButton.backgroundColor = Constant.Color.g4
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentPreviousVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentNextVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .map { _ in reactor.currentState.qurationParameter }
            .withUnretained(self)
            .subscribe(onNext: { vc, quration in
                let nextVC = QurationLoadingVC()
                let nextReactor = QurationLoadingReactor(qurationParameter: quration)
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController(nextVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func bindNavigation() {
        self.title = "손목 건강문답"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Constant.Color.f1
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        
        self.navigationController?.navigationBar.tintColor = Constant.Color.b1
        
        let backButtonItem = UIBarButtonItem(image: UIImage(named: "back_ic"), style: .plain, target: nil, action: nil)
        backButtonItem.tintColor = Constant.Color.b1
        backButtonItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.navigationItem.setLeftBarButtonItems([backButtonItem], animated: false)

        backButtonItem.rx.tap
            .subscribe(onNext: { _ in
                self.navigationController?.popViewController(animated: true)
            }).disposed(by: disposeBag)
    }
}
