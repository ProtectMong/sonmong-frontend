//
//  QurationMainVC.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationMainVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationMainView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.layout(superView: self.view)
    }
    
    func bind(reactor: QurationMainReactor) {
        
        baseView.nextButton.rx.tap
            .debug()
            .map { Reactor.Action.didNextButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentQurationUserInfoVC }
            .distinctUntilChanged()
            .filterNil()
            .filter{ $0 == true }
            .withUnretained(self)
            .subscribe(onNext: { vc, _ in
                let userInfoVC = QurationUserInfoVC()
                let userInfoReactor = QurationUserInfoReactor()
                userInfoVC.reactor = userInfoReactor
                
                vc.navigationController?.pushViewController(userInfoVC, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
    
    init(reactor: QurationMainReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
