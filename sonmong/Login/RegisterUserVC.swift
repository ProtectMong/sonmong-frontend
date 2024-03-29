//
//  RegisterUserVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import UIKit
import RxSwift
import ReactorKit
import RxKeyboard

class RegisterUserVC: UIViewController, View {
    var disposeBag = DisposeBag()
    let baseView = RegisterUserView()
    
    func bind(reactor: RegisterUserReactor) {
        baseView.layout(superView: self.view)
        
        baseView.insertUserNameTextField.rx.text.orEmpty
            .map { Reactor.Action.didUserNameTextChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.insertUserNumberTextField.rx.text.orEmpty
            .map { Reactor.Action.didUserNumberChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.startButton.rx.tap
            .map { Reactor.Action.didStartButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentQurationVC }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let qurationVC = QurationUserInfoVC()
                let qurationReactor = QurationUserInfoReactor()
                qurationVC.reactor = qurationReactor
                
                self.navigationController?.pushViewController(UINavigationController(rootViewController: qurationVC), animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func bindKeyboard() {
        // Tap Keyboard Hide
        let tapGesture = UITapGestureRecognizer(target: baseView, action: #selector(RegisterUserView.endEditing))
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
    
    init(reactor: RegisterUserReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
