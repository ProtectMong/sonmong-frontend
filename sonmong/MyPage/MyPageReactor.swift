//
//  MyPageReactor.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import Foundation
import ReactorKit
import RxSwift

class MyPageReactor: Reactor {
    
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
    
    func mutate(action: MyPageReactor.Action) -> Observable<MyPageReactor.Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: MyPageReactor.State, mutation: MyPageReactor.Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        
        return newState
    }
}
