//
//  PainAreaCollectionViewCellReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import ReactorKit
import RxSwift

class PainAreaCollectionViewCellReactor: Reactor, Equatable {
    
    static func == (lhs: PainAreaCollectionViewCellReactor, rhs: PainAreaCollectionViewCellReactor) -> Bool {
        return lhs.currentState.title == rhs.currentState.title
        
    }
    
    
    enum Action {
        case didDeleteButtonTapped
    }
    
    enum Mutation {
        case setSelectedCellTitle(String?)
    }
    
    struct State {
        var title: String?
        var isSelected: Bool?
        var isCustom: Bool?
        
        var selectedCellTitle: String?
    }
    
    var disposeBag = DisposeBag()
    let initialState: State
    
    init(title: String?, isSelected: Bool?, isCustom: Bool?) {
        self.initialState = State(title: title, isSelected: isSelected, isCustom: isCustom)
    }
    
    func mutate(action: PainAreaCollectionViewCellReactor.Action) -> Observable<PainAreaCollectionViewCellReactor.Mutation> {
        switch action {
        case .didDeleteButtonTapped:
            let currentSelectedTitle = currentState.title
            return Observable.concat([
                .just(Mutation.setSelectedCellTitle(currentSelectedTitle))
            ])
        }
    }
    
    func reduce(state: PainAreaCollectionViewCellReactor.State, mutation: PainAreaCollectionViewCellReactor.Mutation) -> State {
        var newState = state
        switch mutation {
            case .setSelectedCellTitle(let title):
            newState.selectedCellTitle = title
        }
        
        return newState
    }
}
