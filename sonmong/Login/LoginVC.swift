//
//  LoginVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import UIKit
import RxSwift
import ReactorKit
import RxKeyboard
import RxOptional

class LoginVC: UIViewController, View  {
    var disposeBag = DisposeBag()
    let baseView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindKeyboard()
    }
    
    func bind(reactor: LoginReactor) {
        baseView.layout(superView: self.view)
        
        baseView.nameTextField.rx.text.orEmpty
            .map { Reactor.Action.didNameTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.phoneNumberTextField.rx.text.orEmpty
            .skip(1)
            .map { Reactor.Action.didPhoneNumberTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoginButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
                vc.baseView.loginButton.backgroundColor = Constant.Color.m2
                vc.baseView.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoginButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
                vc.baseView.loginButton.backgroundColor = Constant.Color.g2
                vc.baseView.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        baseView.loginButton.rx.tap
            .map { Reactor.Action.didLoginButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentMainVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { vc, _ in
                let mainVC = MainVC()
                if let window = vc.view.window {
                    window.rootViewController = mainVC
                    window.makeKeyAndVisible()
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentAlertMessage }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, message in
//                let actions: [UIAlertController.AlertAction] = [
//                    .action(title: "확인", style: .default)
//                ]
//
//                UIAlertController
//                    .present(in: self, title: "", message: message, style: .alert, actions: actions)
//                    .filter { $0 == 1 }
//                    .withUnretained(self)
//                    .subscribe(onNext: { vc, index in
//
//                        if index == 0 {
//                            
//                        }
//                    })
//                    .disposed(by: self.disposeBag)
            })
            .disposed(by: disposeBag)
        
        baseView.registerButton.rx.tap
            .map { Reactor.Action.didRegisterButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentRegisterVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
//                let registerVC = RegisterVC()
//                let registerReactor = RegisterReactor()
//                registerVC.reactor = registerReactor
//                
//                vc.navigationController?.pushViewController(registerVC, animated: true)
            }).disposed(by: disposeBag)
        
        baseView.findIdButton.rx.tap
            .map { Reactor.Action.didFindIdButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentFindIdVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
//                let findIdVC = FindIdVC()
//                let findIdReactor = FindIdReactor()
//                findIdVC.reactor = findIdReactor
//                
//                vc.navigationController?.pushViewController(findIdVC, animated: true)
            }).disposed(by: disposeBag)
        
        baseView.resetPwdButton.rx.tap
            .map { Reactor.Action.didResetPwdButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentResetPwdCheckIdVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
//                let resetPwdCheckIDVC = ResetPwdCheckIdVC()
//                let resetPwdCheckIDReactor = ResetPwdCheckIdReactor()
//                resetPwdCheckIDVC.reactor = resetPwdCheckIDReactor
//                
//                vc.navigationController?.pushViewController(resetPwdCheckIDVC, animated: true)
            }).disposed(by: disposeBag)
    }
    
    func bindKeyboard() {
        // Tap Keyboard Hide
        let tapGesture = UITapGestureRecognizer(target: baseView, action: #selector(LoginView.endEditing))
        tapGesture.cancelsTouchesInView = false
        self.baseView.addGestureRecognizer(tapGesture)
        
        let scrollView = baseView.baseScrollView

        RxKeyboard.instance.visibleHeight.drive(onNext: {  keyboardVisibleHeight in
                scrollView.contentInset.bottom = keyboardVisibleHeight
            }).disposed(by: disposeBag)

        RxKeyboard.instance.willShowVisibleHeight.drive(onNext: { keyboardVisibleHeight in
                scrollView.contentOffset.y += keyboardVisibleHeight/2
            }).disposed(by: disposeBag)
    }
    
    init(reactor: LoginReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
