//
//  QurationLoadingVC.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class QurationLoadingVC: UIViewController, View {
    
    var disposeBag = DisposeBag()
    let baseView = QurationLoadingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    
    func bind(reactor: QurationLoadingReactor) {
        baseView.layout(superView: self.view)
        
        reactor.state.map{ $0.isQurationFinished }
            .distinctUntilChanged()
            .filterNil()
            .filter { $0 == true }
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                Observable.just("test")
                    .delay(.seconds(5), scheduler: MainScheduler.instance)
                    .subscribe(onNext: { text in
                        let finalVC = QurationFinalVC()
                        let finalReactor = QurationFinalReactor()
                        finalVC.reactor = finalReactor
                        
                        self?.navigationController?.pushViewController(finalVC, animated: true)
                    })
                    .disposed(by: self?.disposeBag ?? DisposeBag())
            })
            .disposed(by: disposeBag)

    }
    
}
