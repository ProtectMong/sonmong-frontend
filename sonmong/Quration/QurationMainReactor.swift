//
//  QurationMainReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import ReactorKit
import RxSwift

class QurationMainReactor: Reactor {
    
    enum Action {
        case viewDidLoaded
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setHistoryDataSource([QurationListData]?)
        case setHistoryCount(Int?)
        case setIsPresentQurationUserInfoVC(Bool?)
        case setIsPresentAlertMessage(String?)
    }
    
    struct State {
        var historyDataSource: [QurationListData]?
        var historyCount: Int?
        var isPresentQurationUserInfoVC: Bool?
        var isPresentAlertMessage: String?
    }
    
    let apiService = APIService()
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: QurationMainReactor.Action) -> Observable<QurationMainReactor.Mutation> {
        switch action {
        case .viewDidLoaded:
            return Observable
                .just(Void())
                .flatMapLatest { self.apiService.getRxSecureRequest(stringUrl: Constant.APIURL.aiCurationList, type: APIResponse<QurationList>.self)}
                .flatMap{ response -> Observable<QurationMainReactor.Mutation> in
                    if response.httpStatus == "OK" {    
                        let list = response.data?.curationList
                        let countOfList = list?.count
                        return Observable.concat([
                            .just(Mutation.setHistoryDataSource(list)),
                            .just(Mutation.setHistoryCount(countOfList))
                        ])
                    } else {
                        let message = response.message
                        return Observable.concat([
                            .just(Mutation.setIsPresentAlertMessage(message)),
                            .just(Mutation.setIsPresentAlertMessage(nil))
                        ])
                    }
                    
                }
            
            
        case .didNextButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentQurationUserInfoVC(true)),
                .just(Mutation.setIsPresentQurationUserInfoVC(nil))
            ])
        }
    }
    
    func reduce(state: QurationMainReactor.State, mutation: QurationMainReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setHistoryDataSource(let history):
            newState.historyDataSource = history
        case .setHistoryCount(let count):
            newState.historyCount = count
        case .setIsPresentQurationUserInfoVC(let isPresent):
            newState.isPresentQurationUserInfoVC = isPresent
        case .setIsPresentAlertMessage(let message):
            newState.isPresentAlertMessage = message
        }
        
        return newState
    }
}
