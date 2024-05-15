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
        case setQurationParameter(Quration?)
        case setQurationDataIsEmptyAlert(Bool?)
        case setQurationResult(QurationAnswer?)
        case setIsQurationFinished(Bool?)
        case setIsPresentAlertMessage(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var qurationDataIsEmptyAlert: Bool?
        var qurationResult: QurationAnswer?
        var isQurationFinished: Bool?
        var isPresentAlertMessage: String?

    }
    
    let apiService = APIService()
    let initialState: State
        
    init() {
        self.initialState = State()
    }
    
    init(qurationParameter: Quration?) {
            self.initialState = State(qurationParameter: qurationParameter)
        }
    
    func mutate(action: QurationLoadingReactor.Action) -> Observable<QurationLoadingReactor.Mutation> {
        switch action {
        case .viewDidLoaded:
            guard let parameter = toDictionary(currentState.qurationParameter) else {
                return Observable.concat([
                    .just(Mutation.setQurationDataIsEmptyAlert(true)),
                    .just(Mutation.setIsQurationFinished(true)),
                    .just(Mutation.setIsQurationFinished(nil))
                ])
            }
            
            return Observable
                .just(Void())
                .flatMapLatest { self.apiService.postRxSecureRequest(stringUrl: Constant.APIURL.aiCuration, parameter: parameter, type: APIResponse<QurationAnswer>.self)}
                .flatMap{ response -> Observable<QurationLoadingReactor.Mutation> in
                    if response.httpStatus == "OK" {
                        return Observable.concat([
                            .just(Mutation.setQurationResult(response.data)),
                            .just(Mutation.setIsQurationFinished(true)),
                            .just(Mutation.setIsQurationFinished(nil))
                        ])
                    } else {
                        let message = response.message
                        return Observable.concat([
                            .just(Mutation.setIsPresentAlertMessage(message)),
                            .just(Mutation.setIsPresentAlertMessage(nil))
                        ])
                    }
                    
                }
        }
    }
    
    func reduce(state: QurationLoadingReactor.State, mutation: QurationLoadingReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setQurationParameter(let parameter):
            newState.qurationParameter = parameter
        case .setQurationDataIsEmptyAlert(let isEmpty):
            newState.qurationDataIsEmptyAlert = isEmpty
        case .setQurationResult(let result):
            newState.qurationResult = result
        case .setIsQurationFinished(let finished):
            newState.isQurationFinished = finished
        case .setIsPresentAlertMessage(let isPresent):
            newState.isPresentAlertMessage = isPresent
        }
        return newState
    }
    
}
