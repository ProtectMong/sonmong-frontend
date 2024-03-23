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
        
        baseView.idTextField.rx.text.orEmpty
            .map { Reactor.Action.didIdTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.idSubTitleIsHidden }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.idSubTitleLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        baseView.pwdTextField.rx.text.orEmpty
            .skip(1)
            .map { Reactor.Action.didPwdTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.pwdSubTitleIsHidden }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.pwdSubTitleLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.pwdSubTitleMessage }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.pwdSubTitleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isIconEyeOn }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isHidden in
                vc.baseView.iconButton.isHidden = false
                vc.baseView.iconButton.setImage(UIImage(named: "pw_eye-off_ic"), for: .normal)
                vc.baseView.pwdTextField.isSecureTextEntry = false
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isIconEyeOn }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, isHidden in
                vc.baseView.iconButton.isHidden = false
                vc.baseView.iconButton.setImage(UIImage(named: "pw_eye_ic"), for: .normal)
                vc.baseView.pwdTextField.isSecureTextEntry = true
            })
            .disposed(by: disposeBag)
        
        baseView.iconButton.rx.tap
            .map { Reactor.Action.didIconButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoginButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
//                vc.baseView.loginButton.backgroundColor = Platform.Color.ff6e40
//                vc.baseView.loginButton.setTitleColor(Platform.Color.ffffff, for: .normal)
//                vc.baseView.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoginButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
//                vc.baseView.loginButton.backgroundColor = Platform.Color.eeeeee
//                vc.baseView.loginButton.setTitleColor(Platform.Color.b7b7ba, for: .normal)
//                vc.baseView.loginButton.isEnabled = isEnabled
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
            .subscribe(onNext: { _ in
                
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
        
        reactor.state.map { $0.isPresentPlatformMainVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
//                let platformMainVC = PlatformMainVC()
//                let platformMainReactor = PlatformMainReactor()
//                platformMainVC.reactor = platformMainReactor
//                
//                vc.navigationController?.pushViewController(platformMainVC, animated: true)
//                
            })
            .disposed(by: disposeBag)
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
