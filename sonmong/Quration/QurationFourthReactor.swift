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
        case setQurationParameter(Quration?)
        case setPastPain(Bool?)
        case setPastMusclePain(Bool?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
        case setIsPresentAlertMesasge(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var pastPain: Bool?
        var pastMusclePain: Bool?
     
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
            var message = ""
            var qurationParameter = currentState.qurationParameter ?? Quration()
            
            if let pastPain = currentState.pastPain {
                qurationParameter.pastMedicalHistory = pastPain
            } else {
                message += "🌟 과거 손목 통증 이력\n"
            }
            
            if let pastMusclePain = currentState.pastMusclePain {
                qurationParameter.differentPastMedicalHistory = pastMusclePain
            } else {
                message += "🌟 과거 다른 관절 혹은 근육 통증 이력\n"
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
        case .setPastPain(let pastData):
            newState.pastPain = pastData
        case .setPastMusclePain(let pastData):
            newState.pastMusclePain = pastData
            
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
