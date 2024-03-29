//
//  QurationFourthReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import RxSwift
import ReactorKit

class QurationFourthReactor: Reactor {
    enum Action {
        case didPastPainYesButtonTapped
        case didPastPainNoButtonTapped
        case didPastMusclePainYesButtonTapped
        case didPastMusclePainNoButtonTapped
        
        case didPreviousButtonTapped
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setPastPain(Bool?)
        case setPastMusclePain(Bool?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var pastPain: Bool?
        var pastMusclePain: Bool?
     
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didPastPainYesButtonTapped:
            return Observable.concat([
                .just(Mutation.setPastPain(true))
            ])
            
        case .didPastPainNoButtonTapped:
            return Observable.concat([
                .just(Mutation.setPastPain(false))
            ])
            
        case .didPastMusclePainYesButtonTapped:
            return Observable.concat([
                .just(Mutation.setPastMusclePain(true))
            ])
            
        case .didPastMusclePainNoButtonTapped:
            return Observable.concat([
                .just(Mutation.setPastMusclePain(false))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentNextVC(true)),
                .just(Mutation.setIsPresentNextVC(nil))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setPastPain(let pastData):
            newState.pastPain = pastData
        case .setPastMusclePain(let pastData):
            newState.pastMusclePain = pastData
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
        }
        return newState
    }
}
