//
//  QurationFinalVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/29/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationFinalVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationFinalView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindNavigation()
        reactor?.action.onNext(.viewDidLoaded)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func bind(reactor: QurationFinalReactor) {
        baseView.layout(superView: self.view)
        
        reactor.state.map { $0.result }
            .filterNil()
            .map { _ in UserDefaults.standard.object(forKey: Constant.UDKey.userName) }
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, userName in
                let levelOfPain = reactor.currentState.requestData?.levelOfPain ?? 0
                let titleText = "\(userName)님의 통증 점수 \(levelOfPain)점"
                vc.baseView.painGradeTitleLable.text = titleText
            })
            .disposed(by: disposeBag)
         
    }
    
    func bindNavigation() {
        self.title = "상담 분석 결과"
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
