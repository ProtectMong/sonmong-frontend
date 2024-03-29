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
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var isQurationFinished: Bool? = true

    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        
        }
        return newState
    }
    
}
