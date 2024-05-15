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
import RxKeyboard

class QurationUserInfoVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationUserInfoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        bindKeyboard()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    func bind(reactor: QurationUserInfoReactor) {
        baseView.layout(superView: self.view)
        setDatePicker()
        
        baseView.birthdayTextField.delegate = self
        baseView.jobOrHobbyUserInputTextField.delegate = self
        
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
            .filter { $0 == true }
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
            .filter { $0 == false }
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
        
        reactor.state.map { $0.inputJobOrHobbyData }
            .distinctUntilChanged()
            .bind(to: baseView.jobOrHobbyUserInputTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.jobOrHobbyUserInputButton.rx.tap
            .map { Reactor.Action.didJobORHobbyButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.jobOrHobbyDataSource }
            .filterNil()
            .bind(to: baseView.jobOrHobbyCollectionView.rx.items(cellIdentifier: "QurationSelectionStyleCell", cellType: QurationSelectionStyleCell.self)) { row, cellReactor, cell in
                
                if cellReactor.currentState.isSelected == true {
                    cell.baseView.layer.borderColor = Constant.Color.m7.cgColor
                    cell.baseView.backgroundColor = Constant.Color.m7_mate
                    cell.titleLabel.textColor = Constant.Color.m7
                } else {
                    cell.baseView.layer.borderColor = Constant.Color.g1.cgColor
                    cell.baseView.backgroundColor = Constant.Color.f1
                    cell.titleLabel.textColor = Constant.Color.g5
                }
                
                cell.deleteButton.isHidden = true
                cell.deleteButton.snp.updateConstraints { make in
                    make.trailing.equalTo(cell.baseView.snp.trailing).offset(-4)
                    make.width.equalTo(0)
                }
                
                cell.titleLabel.text = cellReactor.currentState.title
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
        
        baseView.jobOrHobbyCollectionView.rx.modelSelected(PainAreaCollectionViewCellReactor.self)
            .map { Reactor.Action.didJobOrHobbySelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isNextButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
//                vc.baseView.nextButton.isEnabled = isEnabled
                vc.baseView.nextButton.backgroundColor = Constant.Color.m7
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isNextButtonEnabled }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == false }
            .withUnretained(self)
            .subscribe(onNext: { vc, isEnabled in
//                vc.baseView.nextButton.isEnabled = isEnabled
                vc.baseView.nextButton.backgroundColor = Constant.Color.g4
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
            .subscribe(onNext: { vc, parameter in
                let nextVC = QurationFirstVC()
                let nextReactor = QurationFirstReactor(qurationParameter: parameter)
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController( nextVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangeBirthdayTextFieldError }
            .debug()
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.birthdayTextField.layer.borderColor = Constant.Color.m1.cgColor
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isChangeGenderButtonsError }
            .debug()
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                vc.baseView.genderGirlButton.layer.borderColor = Constant.Color.m1.cgColor
//                vc.baseView.genderGirlButton.backgroundColor = Constant.Color.m1_mate
                vc.baseView.genderBoyButton.layer.borderColor = Constant.Color.m1.cgColor
//                vc.baseView.genderBoyButton.backgroundColor = Constant.Color.m1_mate
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentAlertMesasge }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, message in
                let alert = UIAlertController(title: "필수값을 확인해주세요!", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
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
        
        // UIDatePicker 최소 및 최대 날짜 설정 (옵션)
        if let minDate = dateFormatter.date(from: "1960/01/01"),
           let maxDate = dateFormatter.date(from: "2999/12/31") {
            birthdayPicker.minimumDate = minDate
            birthdayPicker.maximumDate = maxDate
        }
        baseView.birthdayTextField.inputView = birthdayPicker
        baseView.birthdayTextField.inputAccessoryView = toolBar
        
        birthdayPicker.rx.date
            .skip(1)
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { vc, date in
                vc.reactor?.action.onNext(.didBirthdayPickerChanged(date))
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
        resetTextFieldBorders()
        
        textField.layer.borderColor = Constant.Color.m7.cgColor
        
        if textField == baseView.jobOrHobbyUserInputTextField {
            baseView.jobOrHobbyUserInputButton.backgroundColor = Constant.Color.m7
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = Constant.Color.g1.cgColor
        
        if textField == baseView.jobOrHobbyUserInputTextField {
            baseView.jobOrHobbyUserInputButton.backgroundColor = Constant.Color.g2
        }
    }
    
    // 모든 텍스트 필드의 테두리를 초기 상태로 설정하는 메소드
    func resetTextFieldBorders() {
        configureTextFieldBorder(textField: baseView.birthdayTextField)
        configureTextFieldBorder(textField: baseView.jobOrHobbyUserInputTextField)
    }
    
    // 텍스트 필드의 초기 테두리 설정을 위한 메소드
    func configureTextFieldBorder(textField: UITextField) {
        baseView.birthdayTextField.layer.borderColor = Constant.Color.g1.cgColor
        baseView.jobOrHobbyUserInputTextField.layer.borderColor = Constant.Color.g1.cgColor
        baseView.jobOrHobbyUserInputButton.backgroundColor = Constant.Color.g2
    }
}
