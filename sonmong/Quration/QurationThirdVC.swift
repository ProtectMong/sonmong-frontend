//
//  QurationThirdVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationThirdVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationThirdView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bind(reactor: QurationThirdReactor) {
        baseView.layout(superView: self.view)
        
        baseView.painHowTextField.delegate = self
        baseView.painWhenTextField.delegate = self
        
        baseView.painHowTextField.rx.text.orEmpty
            .map { Reactor.Action.didPainHowTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.painHow }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.painHowTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.painWhenTextField.rx.text.orEmpty
            .map { Reactor.Action.didPainWhenTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.painWhen }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.painWhenTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.painWithWorkYesButton.rx.tap
            .map { Reactor.Action.didPainWithWorkYesButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.painWithWorkNoButton.rx.tap
            .map { Reactor.Action.didPainWithWorkNoButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.painWithWork }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painWithWorkYesButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.painWithWorkYesButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.painWithWorkYesButton.setTitleColor(Constant.Color.m7, for: .normal)
                
                vc.baseView.painWithWorkNoButton.backgroundColor = Constant.Color.f1
                vc.baseView.painWithWorkNoButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.painWithWorkNoButton.setTitleColor(Constant.Color.b1, for: .normal)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.painWithWork }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painWithWorkYesButton.backgroundColor = Constant.Color.f1
                vc.baseView.painWithWorkYesButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.painWithWorkYesButton.setTitleColor(Constant.Color.b1, for: .normal)
                
                vc.baseView.painWithWorkNoButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.painWithWorkNoButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.painWithWorkNoButton.setTitleColor(Constant.Color.m7, for: .normal)
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
        
        reactor.state.map { $0.isChangePainHowError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painHowTextField.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangePainWhenError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painWhenTextField.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangeWithWorkError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painWithWorkYesButton.layer.borderColor = Constant.Color.m1.cgColor
                vc.baseView.painWithWorkNoButton.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isNextButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
                vc.baseView.nextButton.backgroundColor = Constant.Color.m7
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
                let nextVC = QurationFourthVC()
                let nextReactor = QurationFourthReactor(qurationParameter: quration)
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
extension QurationThirdVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == baseView.painHowTextField {
            baseView.painHowTextField.layer.borderColor = Constant.Color.m7.cgColor
        } else if textField == baseView.painWhenTextField {
            baseView.painWhenTextField.layer.borderColor = Constant.Color.m7.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == baseView.painHowTextField {
            baseView.painHowTextField.layer.borderColor = Constant.Color.g1.cgColor
        } else if textField == baseView.painWhenTextField {
            baseView.painWhenTextField.layer.borderColor = Constant.Color.g1.cgColor
        }
    }
}
