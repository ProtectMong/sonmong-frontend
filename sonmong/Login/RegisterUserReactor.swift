//
//  RegisterUserReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import Foundation
import RxSwift
import ReactorKit

class RegisterUserReactor: Reactor {
    enum Action {
        case didUserNameTextChanged(String?)
        case didUserNumberChanged(String?)
        case didStartButtonTapped
    }
    
    enum Mutation {
        case setUserName(String?)
        case setUserNumber(String?)
        
        case setIsPresentQurationVC(Bool?)
    }
    
    struct State {
        var userName: String?
        var userNumber: String?
        
        var isPresentQurationVC: Bool?
    }
    
    let initialState = State()
    let apiService = APIService()
    let disposeBag = DisposeBag()

    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didUserNameTextChanged(let inputName):
            return Observable.concat([
                .just(Mutation.setUserName(inputName))
            ])
            
        case .didUserNumberChanged(let inputNumber):
            return Observable.concat([
                .just(Mutation.setUserName(inputNumber))
            ])
            
        case .didStartButtonTapped:
            // 예시 URL, 실제 요청을 위한 유효한 URL로 교체해야 함
            guard let url = URL(string: "https://api.example.com/data") else {
                fatalError("URL is not valid")
            }

//            apiService.request(url: url, , type: <#T##(Decodable & Encodable).Type#>, token: <#T##String#>)
//                .observe(on: MainScheduler.instance) // 메인 스레드에서 관찰
//                .subscribe(onNext: { data in
//                    // 데이터를 성공적으로 받았을 때의 처리
//                    print("Received data: \(data)")
//                }, onError: { error in
//                    // 에러 처리
//                    print("Error: \(error)")
//                })
//                .disposed(by: disposeBag)

            
            return Observable.concat([
                .just(Mutation.setIsPresentQurationVC(true)),
                .just(Mutation.setIsPresentQurationVC(nil))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setUserName(let name):
            newState.userName = name
        case .setUserNumber(let number):
            newState.userNumber = number
            
        case .setIsPresentQurationVC(let isPresent):
            newState.isPresentQurationVC = isPresent
        }
        return newState
    }
}
