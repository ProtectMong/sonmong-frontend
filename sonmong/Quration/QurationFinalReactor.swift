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
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var isEmptyData: Bool?
        var result: QurationAnswer?
    }
    
    let initialState: State
    
    init(isEmptyData: Bool?, result: QurationAnswer?) {
        self.initialState = State(isEmptyData: isEmptyData, result: result)
    }
    
    
    
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}
