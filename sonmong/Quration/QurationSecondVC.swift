//
//  QurationSecondVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationSecondVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationSecondView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        setDatePicker()
    }
    
    func bind(reactor: QurationSecondReactor) {
        baseView.layout(superView: self.view)
        
        baseView.painStartWhenTextField.delegate = self
        
        reactor.state.map { $0.startWhen }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.painStartWhenTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.previousButton.rx.tap
            .map { Reactor.Action.didPreviousButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.nextButton.rx.tap
            .map { Reactor.Action.didNextButtonTapped }
            .bind(to: reactor.action)
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
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let nextVC = QurationThirdVC()
                let nextReactor = QurationThirdReactor()
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController(nextVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func setDatePicker() {
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        
        doneButton.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.endEditing(true)
            })
            .disposed(by: self.disposeBag)
        
        let startWhenPicker = UIDatePicker()
        startWhenPicker.datePickerMode = .date
        startWhenPicker.preferredDatePickerStyle = .wheels
        startWhenPicker.locale = Locale(identifier: "ko-KR")
        // 초기 날짜 설정
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        if let initialDate = dateFormatter.date(from: "2024.01.01") {
            startWhenPicker.date = initialDate
        }
        
        // UIDatePicker 최소 및 최대 날짜 설정 (옵션)
        if let minDate = dateFormatter.date(from: "1900/01/01"),
           let maxDate = dateFormatter.date(from: "2999/12/31") {
            startWhenPicker.minimumDate = minDate
            startWhenPicker.maximumDate = maxDate
        }
        baseView.painStartWhenTextField.inputView = startWhenPicker
        baseView.painStartWhenTextField.inputAccessoryView = toolBar
        
        startWhenPicker.rx.date
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { vc, date in
                vc.reactor?.action.onNext(.didStartWhenPickerChanged(date))
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

extension QurationSecondVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        baseView.painStartWhenTextField.layer.borderColor = Constant.Color.m7.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        baseView.painStartWhenTextField.layer.borderColor = Constant.Color.g1.cgColor
    }
}
