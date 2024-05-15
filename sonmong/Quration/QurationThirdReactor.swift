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
        
        case setIsChangePainHowError(Bool?)
        case setIsChangePainWhenError(Bool?)
        case setIsChangeWithWorkError(Bool?)
        
        case setIsNextButtonEnabled(Bool?)
        case setIsPresentAlertMesasge(String?)
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var qurationParameter: Quration?
        
        var painHow: String?
        var painWhen: String?
        var painWithWork: Bool?
        
        var isChangePainHowError: Bool?
        var isChangePainWhenError: Bool?
        var isChangeWithWorkError: Bool?
        
        var isNextButtonEnabled: Bool?
        var isPresentAlertMesasge: String?
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
            var isNextButtonEnabled: Bool? = false
            
            if quration.howSick != "" {
                if quration.whatActivities == nil || quration.putStrainOnWrist == nil {
                    isNextButtonEnabled = false
                } else {
                    isNextButtonEnabled = true
                }
            } else {
                quration.howSick = nil
                isNextButtonEnabled = false
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainHow(inputData))
            ])
            
        case .didPainWhenTextFieldChanged(let inputData):
            var quration = currentState.qurationParameter ?? Quration()
            quration.whatActivities = inputData
            var isNextButtonEnabled: Bool? = false
            
            if quration.whatActivities != "" {
                if quration.howSick == nil || quration.putStrainOnWrist == nil {
                    isNextButtonEnabled = false
                } else {
                    isNextButtonEnabled = true
                }
            } else {
                quration.whatActivities = nil
                isNextButtonEnabled = false
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWhen(inputData))
            ])
            
        case .didPainWithWorkYesButton:
            var quration = currentState.qurationParameter ?? Quration()
            quration.putStrainOnWrist = true
            var isNextButtonEnabled: Bool? = false
            
            if quration.howSick == nil || quration.howSick == "" || quration.whatActivities == nil || quration.whatActivities == "" {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWithWork(true))
            ])
            
        case .didPainWithWorkNoButton:
            var quration = currentState.qurationParameter ?? Quration()
            quration.putStrainOnWrist = false
            var isNextButtonEnabled: Bool? = false
            
            if quration.howSick == nil || quration.howSick == "" || quration.whatActivities == nil || quration.whatActivities == "" {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setPainWithWork(false))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            var qurationParameter = currentState.qurationParameter
            var isChangePainHowError = false
            var isChangePainWhenError = false
            var isChangeWithWorkError = false
            
            if qurationParameter?.howSick == nil {
                isChangePainHowError = true
            }
            
            if qurationParameter?.whatActivities == nil {
                isChangePainWhenError = true
            }
            
            if qurationParameter?.putStrainOnWrist == nil {
                isChangeWithWorkError = true
            }
            
            if  isChangePainHowError == true || isChangePainWhenError == true || isChangeWithWorkError == true {
                return Observable.concat([
                    .just(Mutation.setIsChangePainHowError(isChangePainHowError)),
                    .just(Mutation.setIsChangePainWhenError(isChangePainWhenError)),
                    .just(Mutation.setIsChangeWithWorkError(isChangeWithWorkError))
                ])
            }
            
            if isChangePainHowError == false && isChangePainWhenError == false && isChangeWithWorkError == false  {
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
        case .setPainHow(let inputData):
            newState.painHow = inputData
        case .setPainWhen(let inputData):
            newState.painWhen = inputData
        case .setPainWithWork(let inputData):
            newState.painWithWork = inputData
            
        case .setIsChangePainHowError(let isChange):
            newState.isChangePainHowError = isChange
        case .setIsChangePainWhenError(let isChange):
            newState.isChangePainWhenError = isChange
        case .setIsChangeWithWorkError(let isChange):
            newState.isChangeWithWorkError = isChange
            
        case .setIsNextButtonEnabled(let isEnabled):
            newState.isNextButtonEnabled = isEnabled
        case .setIsPresentAlertMesasge(let message):
            newState.isPresentAlertMesasge = message
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
        }
        return newState
    }
}
