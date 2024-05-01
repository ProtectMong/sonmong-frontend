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
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
        
        case setIsPresentAlertMesasge(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var levelOfPain: Int?
        var startWhen: String?
        
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
        case .didSliderValueChanged(let inputData):
            return Observable.concat([
                .just(Mutation.setLevelOfPain(inputData))
            ])
            
            
        case .didStartWhenPickerChanged(let inputDate):
            return Observable.concat([
                .just(Mutation.setStartWhen(inputDate?.toString(withFormat: "yyyy.MM.dd")))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            
            var message = ""
            var qurationParameter = currentState.qurationParameter ?? Quration()
            
            if let painLevel = currentState.levelOfPain {
                qurationParameter.levelOfPain = painLevel
            }
            
            if let startWhen = currentState.startWhen {
                qurationParameter.howLong = startWhen.toDate()
            } else {
                message += "🌟 통증 시작일\n"
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
        case .setLevelOfPain(let data):
            newState.levelOfPain = data
        case .setStartWhen(let date):
            newState.startWhen = date
            
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
