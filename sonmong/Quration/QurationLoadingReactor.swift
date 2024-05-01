//
//  QurationLoadingReactor.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/28.
//

import Foundation
import RxSwift
import ReactorKit

class QurationLoadingReactor: Reactor {
    enum Action {
        case viewDidLoaded
    }
    
    enum Mutation {
        case setIsQurationFinished(Bool?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var isQurationFinished: Bool?

    }
    
    let initialState: State
    init(qurationParameter: Quration?) {
        self.initialState = State(qurationParameter: qurationParameter)
    }
    
    let apiService = APIService()
    let disposeBag = DisposeBag()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoaded:
            let quration = currentState.qurationParameter ?? Quration()
            let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMTA4NTk0MzgwMiIsImV4cCI6MTcxNzgyOTY3NCwiaWF0IjoxNzExNzgxNjc0fQ.T8_q7FnuA4HYYRWC5n2l6DJqMIm0w-Hp0zFAq8niCKoㅌ"
            
            return Observable
                .just(Void())
                .flatMapLatest { self.apiService.request(url: Constant.APIURL.aiCuration, parameters: quration.dictionary!, type: APIResponse<QurationAnswer>.self, token: token) }
                .flatMap { response -> Observable<QurationLoadingReactor.Mutation> in
                    print("⚙️ response -> ", response)
                    if response?.httpStatus == "200" {
                        print("📩 message = ", response?.message )
                        print("📦 data = ", response?.data )
                        return Observable.concat([
                            .just(Mutation.setIsQurationFinished(true)),
                            .just(Mutation.setIsQurationFinished(nil))
                        ])
                    } else {
                        return Observable.empty()
                    }
                }
            
//            apiService.request(url: Constant.APIURL.aiCuration, parameters: quration.dictionary!, type: QurationAnswer.self, token: token)
//                .observe(on: MainScheduler.instance) // 메인 스레드에서 관찰
//                .subscribe(onNext: { data in
//                    // 데이터를 성공적으로 받았을 때의 처리
//                    print("Received data: \(data)")
//                    
//                }, onError: { error in
//                    // 에러 처리
//                    print("Error: \(error)")
//                })
//                .disposed(by: disposeBag)
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setIsQurationFinished(let isQuration):
            newState.isQurationFinished = isQuration
            
        }
        return newState
    }
    
}
