//
//  QurationFirstReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import ReactorKit
import RxSwift

class QurationFirstReactor: Reactor {
    
    enum Action {
        case viewDidLoaded
        case didPainAreaSelected(PainAreaCollectionViewCellReactor)
        case didPainAreaTextFieldChanged(String?)
        case didPainAreaUserInputButtonTapped
//        case didCellDeleteButtonTapped(String?)
    }
    
    enum Mutation {
        case setPainAreaDataSource([PainAreaCollectionViewCellReactor]?)
        case setSelectedPainArea([String]?)
        
        case setInputPainAreaData(String?)
    }
    
    struct State {
        var painAreaDataSource: [PainAreaCollectionViewCellReactor]? = [
            PainAreaCollectionViewCellReactor(title: "왼쪽 손바닥쪽", isSelected: false, isCustom: false),
            PainAreaCollectionViewCellReactor(title: "왼쪽 손등쪽", isSelected: false, isCustom: false),
            PainAreaCollectionViewCellReactor(title: "오른쪽 손바닥쪽", isSelected: false, isCustom: false),
            PainAreaCollectionViewCellReactor(title: "오른쪽 손등쪽", isSelected: false, isCustom: false)]
        var selectedPainArea: [String]?
    
        var inputPainAreaData: String?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: QurationFirstReactor.Action) -> Observable<QurationFirstReactor.Mutation> {
        switch action {
        case .viewDidLoaded:
            return Observable.concat([
                
            ])
            
        case .didPainAreaSelected(let inputCellReactor):
            var selectedPainAreas: [String]? = []
            
            let currentRecognizedDatas = currentState.painAreaDataSource?.map ({ cellReactor -> PainAreaCollectionViewCellReactor in
                if cellReactor.currentState.title == inputCellReactor.currentState.title {
                    if inputCellReactor.currentState.isSelected == true {
                        return PainAreaCollectionViewCellReactor(title: inputCellReactor.currentState.title, isSelected: false, isCustom: inputCellReactor.currentState.isCustom)
                    } else {
                        selectedPainAreas?.append(inputCellReactor.currentState.title ?? "")
                        return PainAreaCollectionViewCellReactor(title: inputCellReactor.currentState.title, isSelected: true , isCustom: inputCellReactor.currentState.isCustom)
                    }
                } else {
                    if cellReactor.currentState.isSelected == true {
                        selectedPainAreas?.append(cellReactor.currentState.title ?? "")
                    }
                    return PainAreaCollectionViewCellReactor(title: cellReactor.currentState.title, isSelected: cellReactor.currentState.isSelected, isCustom: cellReactor.currentState.isCustom)
                }
            }) ?? []
            
            print("✅ selectedPainAreas = \(selectedPainAreas)")
            
            return Observable.concat([
                .just(Mutation.setSelectedPainArea(selectedPainAreas)),
                .just(Mutation.setPainAreaDataSource(currentRecognizedDatas))
            ])
            
        case .didPainAreaTextFieldChanged(let inputString):
            return Observable.concat([
                .just(Mutation.setInputPainAreaData(inputString))
            ])
            
        case .didPainAreaUserInputButtonTapped:
            let currentUserInputData = currentState.inputPainAreaData ?? ""
            
            if currentUserInputData == "" || currentUserInputData == nil {
                return Observable.empty()
            }
            
            var currentPainAreaDataSource = currentState.painAreaDataSource ?? []
            let isDuplicate = currentPainAreaDataSource.contains(where: { $0.currentState.title == currentUserInputData })
           
            if !isDuplicate {
                let inputPainAreaAsCellReactor = PainAreaCollectionViewCellReactor(title: currentUserInputData, isSelected: true, isCustom: true)
                currentPainAreaDataSource.append(inputPainAreaAsCellReactor)
            }
            
            var currentSelectedPainAreas = currentState.selectedPainArea ?? []
            if currentSelectedPainAreas.contains(currentUserInputData) == false {
                currentSelectedPainAreas.append(currentUserInputData)
            }
            
            print("✅ selectedPainAreas = \(currentSelectedPainAreas)")
            
            return Observable.concat([
                .just(Mutation.setPainAreaDataSource(currentPainAreaDataSource)),
                .just(Mutation.setSelectedPainArea(currentSelectedPainAreas)),
                .just(Mutation.setInputPainAreaData(nil))
            ])
            
//        case .didCellDeleteButtonTapped(let selectedReactorTitle):
//            var currentPainAreaDataSource = currentState.painAreaDataSource ?? []
//            currentPainAreaDataSource = currentPainAreaDataSource.filter { $0.currentState.title != selectedReactorTitle }
//            
//            var currentSelectedPainAreas = currentState.selectedPainArea ?? []
//            currentSelectedPainAreas = currentSelectedPainAreas.filter { $0 != selectedReactorTitle}
//            
//            print("✅ selectedPainAreas = \(currentSelectedPainAreas)")
//            
//            return Observable.concat([
//                .just(Mutation.setPainAreaDataSource(currentPainAreaDataSource)),
//                .just(Mutation.setSelectedPainArea(currentSelectedPainAreas))
//            ])
        }
    }
    
    func reduce(state: QurationFirstReactor.State, mutation: QurationFirstReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setPainAreaDataSource(let dataSource):
            newState.painAreaDataSource = dataSource
        case .setSelectedPainArea(let painAreas):
            newState.selectedPainArea = painAreas
            
        case .setInputPainAreaData(let painArea):
            newState.inputPainAreaData = painArea
        }
        
        return newState
    }
}
