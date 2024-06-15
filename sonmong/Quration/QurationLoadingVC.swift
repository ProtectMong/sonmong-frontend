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
        reactor?.action.onNext(.viewDidLoaded)
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
            .map { _ in reactor.currentState.qurationDataIsEmptyAlert }
            .asObservable()
            .withUnretained(self)
            .subscribe(onNext: { vc, isQuraitonDataEmpty in
                Observable.just("test")
                    .delay(.seconds(3), scheduler: MainScheduler.instance)
                    .subscribe(onNext: { text in
                        let result = reactor.currentState.qurationResult
                        let request = reactor.currentState.qurationParameter
                        let finalVC = QurationFinalVC()
                        let finalReactor = QurationFinalReactor(isEmptyData: isQuraitonDataEmpty, requestData: request, result: result)
                        finalVC.reactor = finalReactor
                        
                        vc.navigationController?.pushViewController(finalVC, animated: true)
                    })
                    .disposed(by: vc.disposeBag)
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isPresentAlertMessage }
            .distinctUntilChanged()
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { vc, message in
                let alert = UIAlertController(title: "오류가 발생했습니다!", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                
                vc.present(alert, animated: true, completion: {
                    vc.navigationController?.popToRootViewController(animated: true)
                })
            })
            .disposed(by: disposeBag)

    }
    
}
