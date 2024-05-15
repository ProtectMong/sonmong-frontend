//
//  QurationSecondReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import Foundation
import RxSwift
import ReactorKit

class QurationSecondReactor: Reactor {
    enum Action {
        case didSliderValueChanged(Int?)
        case didStartWhenPickerChanged(Date?)
        
        case didPreviousButtonTapped
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setQurationParameter(Quration?)
        
        case setLevelOfPain(Int?)
        case setStartWhen(String?)
        
        case setIsChangeSliderViewError(Bool?)
        case setIsChangeStartWhenTextFieldError(Bool?)
        
        case setIsNextButtonEnabled(Bool?)
        case setIsPresentAlertMesasge(String?)
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var qurationParameter: Quration?
        
        var levelOfPain: Int?
        var startWhen: String?
        
        var isChangeSliderViewError: Bool?
        var isChangeStartWhenTextFieldError: Bool?
        
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
        case .didSliderValueChanged(let inputData):
            var quration = currentState.qurationParameter ?? Quration()
            quration.levelOfPain = inputData
            var isNextButtonEnabled: Bool? = false
            
            if quration.howLong == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setLevelOfPain(inputData))
            ])
            
        case .didStartWhenPickerChanged(let inputDate):
            var quration = currentState.qurationParameter ?? Quration()
            quration.howLong = inputDate?.toString(withFormat: "yyyy.MM.dd")
            
            var isNextButtonEnabled: Bool? = false
            
            if quration.levelOfPain == nil {
                isNextButtonEnabled = false
            } else {
                isNextButtonEnabled = true
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setQurationParameter(quration)),
                .just(Mutation.setStartWhen(inputDate?.toString(withFormat: "yyyy.MM.dd")))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            var qurationParameter = currentState.qurationParameter
            var isChangeSliderViewError = false
            var isChangeStartWhenTextFieldError = false
            
            if qurationParameter?.levelOfPain == nil {
                isChangeSliderViewError = true
            }
            
            if qurationParameter?.howLong == nil {
                isChangeStartWhenTextFieldError = true
            }
            
            if  isChangeSliderViewError == true || isChangeStartWhenTextFieldError == true {
                return Observable.concat([
                    .just(Mutation.setIsChangeSliderViewError(isChangeSliderViewError)),
                    .just(Mutation.setIsChangeStartWhenTextFieldError(isChangeStartWhenTextFieldError))
                ])
            }
            
            if isChangeSliderViewError == false && isChangeStartWhenTextFieldError == false {
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
        case .setLevelOfPain(let data):
            newState.levelOfPain = data
        case .setStartWhen(let date):
            newState.startWhen = date
            
        case .setIsChangeSliderViewError(let isChange):
            newState.isChangeSliderViewError = isChange
        case .setIsChangeStartWhenTextFieldError(let isChange):
            newState.isChangeStartWhenTextFieldError = isChange
            
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
