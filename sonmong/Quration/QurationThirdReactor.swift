//
//  QurationThirdReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import RxSwift
import ReactorKit

class QurationThirdReactor: Reactor {
    enum Action {
        case didPainHowTextFieldChanged(String?)
        case didPainWhenTextFieldChanged(String?)
        case didPainWithWorkYesButton
        case didPainWithWorkNoButton
        
        case didPreviousButtonTapped
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setQurationParameter(Quration?)
        
        case setPainHow(String?)
        case setPainWhen(String?)
        case setPainWithWork(Bool?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var qurationParameter: Quration?
        
        var painHow: String?
        var painWhen: String?
        var painWithWork: Bool?
        
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    init(qurationParameter: Quration?) {
        self.initialState = State(qurationParameter: qurationParameter)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didPainHowTextFieldChanged(let inputData):
            var quration = currentState.qurationParameter ?? Quration()
            quration.howSick = inputData
            
            return Observable.concat([
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainHow(inputData))
            ])
            
        case .didPainWhenTextFieldChanged(let inputData):
            var quration = currentState.qurationParameter ?? Quration()
            quration.whatActivities = inputData
            
            return Observable.concat([
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWhen(inputData))
            ])
            
        case .didPainWithWorkYesButton:
            var quration = currentState.qurationParameter ?? Quration()
            quration.putStrainOnWrist = true
            
            return Observable.concat([
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWithWork(true))
            ])
            
        case .didPainWithWorkNoButton:
            var quration = currentState.qurationParameter ?? Quration()
            quration.putStrainOnWrist = false
            
            return Observable.concat([
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWithWork(false))
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
        case .setQurationParameter(let quration):
            newState.qurationParameter = quration
        case .setPainHow(let inputData):
            newState.painHow = inputData
        case .setPainWhen(let inputData):
            newState.painWhen = inputData
        case .setPainWithWork(let inputData):
            newState.painWithWork = inputData
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
        }
        return newState
    }
}
