//
//  QurationFinalReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/29/24.
//

import Foundation
import Foundation
import RxSwift
import ReactorKit

class QurationFinalReactor: Reactor {
    enum Action {
        case viewDidLoaded
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var isEmptyData: Bool?
        var requestData: Quration?
        var result: QurationAnswer?
    }
    
    let initialState: State
    
    init(isEmptyData: Bool?, requestData: Quration?, result: QurationAnswer?) {
        self.initialState = State(isEmptyData: isEmptyData, requestData: requestData, result: result)
    }
    
    
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoaded:
            let result = currentState.result
            print("result= ", result)
            
            return Observable.concat([])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}
