//
//  SNSLoginReactor.swift
//  sonmong
//
//  Created by 이은솔 on 6/2/24.
//

import Foundation
import ReactorKit
import RxSwift

class SNSLoginReactor: Reactor {
    
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: SNSLoginReactor.Action) -> Observable<SNSLoginReactor.Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: SNSLoginReactor.State, mutation: SNSLoginReactor.Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        
        return newState
    }
}

