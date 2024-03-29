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
        case didSonmongButtonTapped
        case didQurationListGpDetailButtonTapped
        case didGoQurationButtonTapped
    }
    
    enum Mutation {
        case setIsPresentQurationMainVC(Bool?)
        case setIsPresentQurationUserInfoVC(Bool?)
        case setIsPresentAlertMessage(Bool?)
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
        var isPresentAlertMessage: Bool?
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
            
        case .didSonmongButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentAlertMessage(true)),
                .just(Mutation.setIsPresentAlertMessage(nil))
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
        case .setIsPresentAlertMessage(let isPresent):
            newState.isPresentAlertMessage = isPresent
        }
        
        return newState
    }
}
