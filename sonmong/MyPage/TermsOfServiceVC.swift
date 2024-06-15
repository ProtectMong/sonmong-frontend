//
//  TermsOfServiceVC.swift
//  sonmong
//
//  Created by 이은솔 on 6/15/24.
//
import Foundation
import UIKit
import RxSwift
import ReactorKit

class TermsOfServiceVC:UIViewController, View {
    var disposeBag = DisposeBag()
    let baseView = TermsOfServiceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
    }
    
    func bind(reactor: TermsOfServiceReactor) {
        baseView.layout(superView: self.view)
        
        reactor.state.map { $0.content }
            .distinctUntilChanged()
            .bind(to: baseView.label.rx.text)
            .disposed(by: disposeBag)
    }
    
    func bindNavigation() {
        self.title = "서비스 이용약관"
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

