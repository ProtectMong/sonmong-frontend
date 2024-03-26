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
        case viewDidLoaded
        case didAIButtonTapped
        case didQurationListGpDetailButtonTapped
        case didGoQurationButtonTapped
    }
    
    enum Mutation {
        case setIsPresentQurationMainVC(Bool?)
        case setIsPresentQurationUserInfoVC(Bool?)
    }
    
    struct State {
//        var qurationListDatasource:[String]? = [ "통증점수 1점",
//                                       "통증점수 2점",
//                                       "통증점수 3점"]
//        var isQurationListTableHidden: Bool? = false
        
        var qurationListDatasource:[String]?
        var isQurationListTableHidden: Bool? = true
        
        var isPresentQurationMainVC: Bool?
        var isPresentQurationUserInfoVC: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: HomeReactor.Action) -> Observable<HomeReactor.Mutation> {
        switch action {
        case .viewDidLoaded:
            return Observable.concat([
            
            ])
        case .didAIButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentQurationMainVC(true)),
                .just(Mutation.setIsPresentQurationMainVC(nil))
            ])
            
        case .didQurationListGpDetailButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentQurationMainVC(true)),
                .just(Mutation.setIsPresentQurationMainVC(nil))
            ])
            
        case .didGoQurationButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentQurationUserInfoVC(true)),
                .just(Mutation.setIsPresentQurationUserInfoVC(nil))
            ])
        }
    }
    
    func reduce(state: HomeReactor.State, mutation: HomeReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setIsPresentQurationMainVC(let isPresent):
            newState.isPresentQurationMainVC = isPresent
        case .setIsPresentQurationUserInfoVC(let isPresent):
            newState.isPresentQurationUserInfoVC = isPresent
        }
        
        return newState
    }
}
