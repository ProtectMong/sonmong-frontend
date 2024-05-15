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

class QurationSecondVC: UIViewController, View, SliderViewDelegate {
    func sliderView(_ sender: SliderView, changedValue value: Int) {
        self.baseView.painLevelView.layer.borderColor = Constant.Color.m7.cgColor
        let newValue = value - 1
        if newValue == 0 {
            self.baseView.painLevelTextLabel.text = "정도\(newValue), 안 아파요."
        } else if newValue > 0 && newValue <= 3 {
            self.baseView.painLevelTextLabel.text = "정도\(newValue), 조금 아파요."
        } else if newValue > 3 && newValue <= 6 {
            self.baseView.painLevelTextLabel.text = "정도\(newValue), 아파요."
        } else {
            self.baseView.painLevelTextLabel.text = "정도\(newValue), 많이 아파요."
        }
        reactor?.action.onNext(.didSliderValueChanged(newValue))
    }
    
    var disposeBag = DisposeBag()
    let baseView = QurationSecondView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        setDatePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bind(reactor: QurationSecondReactor) {
        baseView.layout(superView: self.view)
        
        baseView.painStartWhenTextField.delegate = self
        baseView.painLevelSlider.delegate = self
        
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
        
        reactor.state.map { $0.isChangeSliderViewError }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painLevelView.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangeStartWhenTextFieldError }
            .debug()
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.painStartWhenTextField.layer.borderColor = Constant.Color.m1.cgColor
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
                let nextVC = QurationThirdVC()
                let nextReactor = QurationThirdReactor(qurationParameter: quration)
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController(nextVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentAlertMesasge }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, message in
                let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
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
        
        // UIDatePicker 최소 및 최대 날짜 설정 (옵션)
        if let minDate = dateFormatter.date(from: "1900/01/01"),
           let maxDate = dateFormatter.date(from: "2999/12/31") {
            startWhenPicker.minimumDate = minDate
            startWhenPicker.maximumDate = maxDate
        }
        baseView.painStartWhenTextField.inputView = startWhenPicker
        baseView.painStartWhenTextField.inputAccessoryView = toolBar
        
        startWhenPicker.rx.date
            .skip(1)
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
        baseView.painLevelView.layer.borderColor = Constant.Color.g1.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        baseView.painStartWhenTextField.layer.borderColor = Constant.Color.g1.cgColor
    }
}
