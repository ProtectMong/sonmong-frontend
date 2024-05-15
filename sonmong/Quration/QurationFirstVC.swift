//
//  QurationFirstVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import RxKeyboard

class QurationFirstVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationFirstView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        bindKeyboard()
        bindTextFieldToolBar()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bind(reactor: QurationFirstReactor) {
        baseView.layout(superView: self.view)
        
        baseView.painAreaUserInputTextField.delegate = self
        baseView.painDetailAreaUserInputTextField.delegate = self
        
        reactor.state.map { $0.painAreaDataSource }
            .filterNil()
            .bind(to: baseView.painAreaCollectionView.rx.items(cellIdentifier: "QurationSelectionStyleCell", cellType: QurationSelectionStyleCell.self)) { row, cellReactor, cell in
                cell.titleLabel.text = cellReactor.currentState.title
                
                if cellReactor.currentState.isSelected == true {
                    cell.baseView.layer.borderColor = Constant.Color.m7.cgColor
                    cell.baseView.backgroundColor = Constant.Color.m7_mate
                    cell.titleLabel.textColor = Constant.Color.m7
//                    cell.deleteButton.setImage(UIImage(named: "close-outline"), for: .normal)
                } else {
                    cell.baseView.layer.borderColor = Constant.Color.g1.cgColor
                    cell.baseView.backgroundColor = Constant.Color.f1
                    cell.titleLabel.textColor = Constant.Color.g5
//                    cell.deleteButton.setImage(UIImage(named: "close-outline"), for: .normal)
                }
                
                cell.deleteButton.isHidden = true
                cell.deleteButton.snp.updateConstraints { make in
                    make.trailing.equalTo(cell.baseView.snp.trailing).offset(-4)
                    make.width.equalTo(0)
                }
                
//                if cellReactor.currentState.isCustom == false {
//                    cell.deleteButton.isHidden = true
//                    cell.deleteButton.snp.updateConstraints { make in
//                        make.trailing.equalTo(cell.baseView.snp.trailing).offset(-4)
//                        make.width.equalTo(0)
//                    }
//                } else {
//                    cell.deleteButton.isHidden = false
//                    cell.deleteButton.snp.updateConstraints { make in
//                        make.trailing.equalTo(cell.baseView.snp.trailing).offset(-10)
//                        make.width.equalTo(16)
//                    }
//                }
                
//                cell.deleteButton.rx.tap
//                    .map { Reactor.Action.didCellDeleteButtonTapped(cellReactor.currentState.title)}
//                    .bind(to: reactor.action)
//                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
        
        baseView.painAreaCollectionView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.painAreaCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
        baseView.painAreaCollectionView.rx.modelSelected(PainAreaCollectionViewCellReactor.self)
            .map { Reactor.Action.didPainAreaSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.painAreaUserInputTextField.rx.text.orEmpty
            .map { Reactor.Action.didPainAreaTextFieldChanged($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.inputPainAreaData }
            .distinctUntilChanged()
            .bind(to: baseView.painAreaUserInputTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.painAreaUserInputButton.rx.tap
            .map { Reactor.Action.didPainAreaUserInputButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.painDetailAreaDataSource }
            .filterNil()
            .bind(to: baseView.painDetailAreaCollectionView.rx.items(cellIdentifier: "QurationSelectionStyleCell", cellType: QurationSelectionStyleCell.self)) { row, cellReactor, cell in
                cell.titleLabel.text = cellReactor.currentState.title
                
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
                
            }
            .disposed(by: disposeBag)
        
        baseView.painDetailAreaCollectionView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, contentSize in
                vc.baseView.painDetailAreaCollectionView.snp.updateConstraints { make in
                    make.height.equalTo(contentSize.height)
                }
                self.baseView.layoutIfNeeded()
            }).disposed(by: disposeBag)
        
        baseView.painDetailAreaCollectionView.rx.modelSelected(PainAreaCollectionViewCellReactor.self)
            .map { Reactor.Action.didPainDetailAreaSelected($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        baseView.painDetailAreaUserInputTextField.rx.text.orEmpty
            .map { Reactor.Action.didPainDetailAreaTextFieldChanged($0)}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.inputPainDetailAreaData }
            .distinctUntilChanged()
            .bind(to: baseView.painDetailAreaUserInputTextField.rx.text)
            .disposed(by: disposeBag)
        
        baseView.painDetailAreaUserInputButton.rx.tap
            .map { Reactor.Action.didPainDetailAreaUserInputButtonTapped }
            .bind(to: reactor.action)
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
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, quration in
                let nextVC = QurationSecondVC()
                let nextReactor = QurationSecondReactor(qurationParameter: quration)
                nextVC.reactor = nextReactor
                
                vc.navigationController?.pushViewController(nextVC, animated: true)
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
    
    func bindTextFieldToolBar() {
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
        
        baseView.painAreaUserInputTextField.inputAccessoryView = toolBar
        baseView.painDetailAreaUserInputTextField.inputAccessoryView = toolBar
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

extension QurationFirstVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        resetTextFieldBorders()
        
        textField.layer.borderColor = Constant.Color.m7.cgColor
        
        if textField == baseView.painAreaUserInputTextField {
            baseView.painAreaUserInputButton.backgroundColor = Constant.Color.m7
        } else if textField == baseView.painDetailAreaUserInputTextField {
            baseView.painDetailAreaUserInputButton.backgroundColor = Constant.Color.m7
        } else {
            baseView.painAreaUserInputButton.backgroundColor = Constant.Color.g2
            baseView.painDetailAreaUserInputButton.backgroundColor = Constant.Color.g2
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = Constant.Color.g1.cgColor
        
        if textField == baseView.painAreaUserInputTextField {
            baseView.painAreaUserInputButton.backgroundColor = Constant.Color.g2
        } else if textField == baseView.painDetailAreaUserInputTextField {
            baseView.painDetailAreaUserInputButton.backgroundColor = Constant.Color.g2
        } else {
            baseView.painAreaUserInputButton.backgroundColor = Constant.Color.g2
            baseView.painDetailAreaUserInputButton.backgroundColor = Constant.Color.g2
        }
    }
    
    // 모든 텍스트 필드의 테두리를 초기 상태로 설정하는 메소드
    func resetTextFieldBorders() {
        configureTextFieldBorder(textField: baseView.painAreaUserInputTextField)
        configureTextFieldBorder(textField: baseView.painDetailAreaUserInputTextField)
    }
    
    // 텍스트 필드의 초기 테두리 설정을 위한 메소드
    func configureTextFieldBorder(textField: UITextField) {
        baseView.painAreaUserInputTextField.layer.borderColor = Constant.Color.g1.cgColor
        baseView.painAreaUserInputButton.backgroundColor = Constant.Color.g2
    }
}
