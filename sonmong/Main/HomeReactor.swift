//
//  HomeReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import ReactorKit
import RxSwift

class HomeReactor: Reactor {
    
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
    
    func mutate(action: HomeReactor.Action) -> Observable<HomeReactor.Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: HomeReactor.State, mutation: HomeReactor.Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        
        return newState
    }
}
