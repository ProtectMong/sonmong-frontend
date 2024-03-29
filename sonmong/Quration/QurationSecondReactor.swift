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
        case setLevelOfPain(Int?)
        case setStartWhen(String?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var levelOfPain: Int?
        var startWhen: String?
        
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
    }
    
    let initialState = State()
    
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
            return Observable.concat([
                .just(Mutation.setIsPresentNextVC(true)),
                .just(Mutation.setIsPresentNextVC(nil))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setLevelOfPain(let data):
            newState.levelOfPain = data
        case .setStartWhen(let date):
            newState.startWhen = date
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
        }
        return newState
    }
}
