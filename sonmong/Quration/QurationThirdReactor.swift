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
        
        case setIsPresentAlertMesasge(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var painHow: String?
        var painWhen: String?
        var painWithWork: Bool?
        
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
        
        var isPresentAlertMesasge: String?
    }
    
    let initialState: State
    init(qurationParameter: Quration?) {
        self.initialState = State(qurationParameter: qurationParameter)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didPainHowTextFieldChanged(let inputData):
            return Observable.concat([
                .just(Mutation.setPainHow(inputData))
            ])
            
        case .didPainWhenTextFieldChanged(let inputData):
            return Observable.concat([
                .just(Mutation.setPainWhen(inputData))
            ])
            
        case .didPainWithWorkYesButton:
            return Observable.concat([
                .just(Mutation.setPainWithWork(true))
            ])
            
        case .didPainWithWorkNoButton:
            return Observable.concat([
                .just(Mutation.setPainWithWork(false))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            
            var message = ""
            var qurationParameter = currentState.qurationParameter ?? Quration()
            
            if let painHow = currentState.painHow {
                qurationParameter.howSick = painHow
            }
            
            if let painWhen = currentState.painWhen {
                qurationParameter.whatActivities = painWhen
            }
            if let painWithWork = currentState.painWithWork {
                qurationParameter.putStrainOnWrist = painWithWork
            }
            
            if message == "" {
                return Observable.concat([
                    .just(Mutation.setQurationParameter(qurationParameter)),
                    .just(Mutation.setIsPresentNextVC(true)),
                    .just(Mutation.setIsPresentNextVC(nil))
                ])
            } else {
                return Observable.concat([
                    .just(Mutation.setIsPresentAlertMesasge(message)),
                    .just(Mutation.setIsPresentAlertMesasge(nil))
                ])
            }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setQurationParameter(let parameter):
            newState.qurationParameter = parameter
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
            
        case .setIsPresentAlertMesasge(let message):
            newState.isPresentAlertMesasge = message
        }
        return newState
    }
}
