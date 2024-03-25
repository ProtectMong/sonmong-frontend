//
//  QurationMainReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import ReactorKit
import RxSwift

class QurationMainReactor: Reactor {
    
    enum Action {
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setIsPresentQurationUserInfoVC(Bool?)
    }
    
    struct State {
        var historyDataSource: [String]? = [
        "통증점수 1점",
        "통증점수 2점",
        "통증점수 3점"
        ]
        var isPresentQurationUserInfoVC: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: QurationMainReactor.Action) -> Observable<QurationMainReactor.Mutation> {
        switch action {
        case .didNextButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentQurationUserInfoVC(true)),
                .just(Mutation.setIsPresentQurationUserInfoVC(nil))
            ])
        }
    }
    
    func reduce(state: QurationMainReactor.State, mutation: QurationMainReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setIsPresentQurationUserInfoVC(let isPresent):
            newState.isPresentQurationUserInfoVC = isPresent
        }
        
        return newState
    }
}
