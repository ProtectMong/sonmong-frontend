//
//  QurationUserInfoVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationUserInfoVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationUserInfoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    func bind(reactor: QurationUserInfoReactor) {
        baseView.layout(superView: self.view)
        setDatePicker()
        
        baseView.birthdayTextField.delegate = self
        
        reactor.state.map { $0.birthday }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.birthdayTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.genderGirlButton.rx.tap
            .map { Reactor.Action.didGenderGirlButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.genderBoyButton.rx.tap
            .map { Reactor.Action.didGenderBoyButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.gender }
            .distinctUntilChanged()
            .filter { $0 == "W" }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.genderGirlButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.genderGirlButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.genderGirlButton.setTitleColor(Constant.Color.m7, for: .normal)
                
                vc.baseView.genderBoyButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.genderBoyButton.backgroundColor = Constant.Color.f1
                vc.baseView.genderBoyButton.setTitleColor(Constant.Color.b1, for: .normal)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.gender }
            .distinctUntilChanged()
            .filter { $0 == "M" }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.genderGirlButton.layer.borderColor = Constant.Color.g1.cgColor
                vc.baseView.genderGirlButton.backgroundColor = Constant.Color.f1
                vc.baseView.genderGirlButton.setTitleColor(Constant.Color.b1, for: .normal)
                
                vc.baseView.genderBoyButton.layer.borderColor = Constant.Color.m7.cgColor
                vc.baseView.genderBoyButton.backgroundColor = Constant.Color.m7_mate
                vc.baseView.genderBoyButton.setTitleColor(Constant.Color.m7, for: .normal)
            })
            .disposed(by: disposeBag)
        
        baseView.jobOrHobbyUserInputTextField.rx.text.orEmpty
            .map { Reactor.Action.didJobOrHabbyTextFieldChanged($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.jobOrHobbyDataSource }
            .distinctUntilChanged()
            .filterNil()
            .bind(to: baseView.jobOrHobbyCollectionView.rx.items(cellIdentifier: "QurationSelectionStyleCell", cellType: QurationSelectionStyleCell.self)) { row, data, cell in
//                cell.deleteButton.isHidden = true
//                cell.titleLabel.text = data
            }
            .disposed(by: disposeBag)
        
        baseView.jobOrHobbyCollectionView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.jobOrHobbyCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                
                vc.baseView.jobOrHobbyUserInputButton.snp.updateConstraints { make in
                    make.top.equalTo(vc.baseView.jobOrHobbyCollectionView.snp.bottom).offset(7)
                }
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
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
                let nextVC = QurationFirstVC()
                let nextReactor = QurationFirstReactor()
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController( nextVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
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
        
        let birthdayPicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthdayPicker.locale = Locale(identifier: "ko-KR")
        // 초기 날짜 설정
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        if let initialDate = dateFormatter.date(from: "1900.01.01") {
            birthdayPicker.date = initialDate
        }
        
        // UIDatePicker 최소 및 최대 날짜 설정 (옵션)
        if let minDate = dateFormatter.date(from: "1900/01/01"),
           let maxDate = dateFormatter.date(from: "2999/12/31") {
            birthdayPicker.minimumDate = minDate
            birthdayPicker.maximumDate = maxDate
        }
        baseView.birthdayTextField.inputView = birthdayPicker
        baseView.birthdayTextField.inputAccessoryView = toolBar
        
        birthdayPicker.rx.date
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { vc, date in
                vc.reactor?.action.onNext(.didBirthdayPickerChanged(date))
            })
            .disposed(by: disposeBag)
    }
    
    func bindNavigation() {
        self.title = "손목 건강문답"
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.backgroundColor = nil
        self.navigationController?.navigationBar.barTintColor = Constant.Color.f2
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)
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

extension QurationUserInfoVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        baseView.birthdayTextField.layer.borderColor = Constant.Color.m7.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        baseView.birthdayTextField.layer.borderColor = Constant.Color.g1.cgColor
    }
}
