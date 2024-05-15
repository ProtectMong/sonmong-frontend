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
        
        case setIsChangePastPainError(Bool?)
        case setIsChangePastMusclePainError(Bool?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
        case setIsNextButtonEnabled(Bool?)
        case setIsPresentAlertMesasge(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var pastPain: Bool?
        var pastMusclePain: Bool?
        
        var isChangePastPainError: Bool?
        var isChangePastMusclePainError: Bool?
     
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
        var isNextButtonEnabled: Bool?
        var isPresentAlertMesasge: String?
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
        case .didPastPainYesButtonTapped:
            var quration = currentState.qurationParameter ?? Quration()
            quration.pastMedicalHistory = true
            var isNextButtonEnabled: Bool? = false
            
            if quration.differentPastMedicalHistory == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPastPain(true))
            ])
            
        case .didPastPainNoButtonTapped:
            var quration = currentState.qurationParameter ?? Quration()
            quration.pastMedicalHistory = false
            var isNextButtonEnabled: Bool? = false
            
            if quration.differentPastMedicalHistory == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPastPain(false))
            ])
            
        case .didPastMusclePainYesButtonTapped:
            var quration = currentState.qurationParameter ?? Quration()
            quration.differentPastMedicalHistory = true
            var isNextButtonEnabled: Bool? = false
            
            if quration.pastMedicalHistory == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPastMusclePain(true))
            ])
            
        case .didPastMusclePainNoButtonTapped:
            var quration = currentState.qurationParameter ?? Quration()
            quration.differentPastMedicalHistory = false
            var isNextButtonEnabled: Bool? = false
            
            if quration.pastMedicalHistory == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPastMusclePain(false))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            var qurationParameter = currentState.qurationParameter
            var isChangePastPainError = false
            var isChangePastMusclePainError = false
            
            if qurationParameter?.pastMedicalHistory == nil {
                isChangePastPainError = true
            }
            
            if qurationParameter?.differentPastMedicalHistory == nil {
                isChangePastMusclePainError = true
            }
            
            if  isChangePastPainError == true || isChangePastMusclePainError == true {
                return Observable.concat([
                    .just(Mutation.setIsChangePastPainError(isChangePastPainError)),
                    .just(Mutation.setIsChangePastMusclePainError(isChangePastMusclePainError))
                ])
            }
            
            if isChangePastPainError == false && isChangePastMusclePainError == false {
                return Observable.concat([
                    .just(Mutation.setIsPresentNextVC(true)),
                    .just(Mutation.setIsPresentNextVC(nil))
                ])
            } else {
                let message = "오류가 발생했습니다. 잠시 후 다시 이용해주세요."
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
        case .setQurationParameter(let quration):
            newState.qurationParameter = quration
        case .setPastPain(let pastData):
            newState.pastPain = pastData
        case .setPastMusclePain(let pastData):
            newState.pastMusclePain = pastData
            
        case .setIsChangePastPainError(let isChange):
            newState.isChangePastPainError = isChange
        case .setIsChangePastMusclePainError(let isChange):
            newState.isChangePastMusclePainError = isChange
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
        case .setIsNextButtonEnabled(let isEnable):
            newState.isNextButtonEnabled = isEnable
        case .setIsPresentAlertMesasge(let isPresent):
            newState.isPresentAlertMesasge = isPresent
        }
        return newState
    }
}
