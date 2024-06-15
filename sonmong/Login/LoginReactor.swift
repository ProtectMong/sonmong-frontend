//
//  LoginReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import Foundation
import RxSwift
import ReactorKit

class LoginReactor: Reactor {
    enum Action {
        case didNameTextFieldChanged(String?)
        case didPhoneNumberTextFieldChanged(String?)
        case didLoginButtonTapped
        case didRegisterButtonTapped
        case didFindIdButtonTapped
        case didResetPwdButtonTapped
    }
    
    enum Mutation {
        case setName(String?)
        case setPhoneNumber(String?)
        case setIsLoginButtonEnabled(Bool?)
        
        case setIsPresentRegisterVC(Bool?)
        case setIsPresentFindIdVC(Bool?)
        case setIsPresentResetPwdCheckIdVC(Bool?)
        
        case setIsPresentMainVC(Bool?)
        
        case setIsPresentAlertMessage(String?)
    }
    
    struct State {
        var name: String?
        var phoneNumber: String?
        var isLoginButtonEnabled: Bool? = false
        
        var isPresentRegisterVC: Bool?
        var isPresentFindIdVC: Bool?
        var isPresentResetPwdCheckIdVC: Bool?
        
        var isPresentMainVC: Bool?
        
        var isPresentAlertMessage: String?
    }
    
    let initialState = State()
    let service = LoginService()
    let apiService = APIService()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didNameTextFieldChanged(let inputName):
            let phoneNumber = currentState.phoneNumber
            if phoneNumber == nil || phoneNumber == "" {
                return Observable.concat([
                    .just(Mutation.setName(inputName)),
                    .just(Mutation.setIsLoginButtonEnabled(false)),
                ])
            } else {
                return Observable.concat([
                    .just(Mutation.setName(inputName)),
                    .just(Mutation.setIsLoginButtonEnabled(true)),
                ])
            }
            
        case .didPhoneNumberTextFieldChanged(let inputNumber):
            let name = currentState.name
            if name == "" || name == nil {
                return Observable.concat([
                    .just(Mutation.setPhoneNumber(inputNumber)),
                    .just(Mutation.setIsLoginButtonEnabled(false)),
                ])
            } else {
                return Observable.concat([
                    .just(Mutation.setPhoneNumber(inputNumber)),
                    .just(Mutation.setIsLoginButtonEnabled(true))
                ])
            }
        
        case .didLoginButtonTapped:
            let name = currentState.name
            if name == "" || name == nil {
                let message = "이름을 입력해주세요!"
                return Observable.concat([
                    .just(Mutation.setIsPresentAlertMessage(message)),
                    .just(Mutation.setIsPresentAlertMessage(nil))
                ])
            }
            
            let phoneNumber = currentState.phoneNumber
            if phoneNumber == nil || phoneNumber == "" {
                let message = "전화번호를 입력해주세요!"
                return Observable.concat([
                    .just(Mutation.setIsPresentAlertMessage(message)),
                    .just(Mutation.setIsPresentAlertMessage(nil))
                ])
            }
            
            let parameter = [
                "phoneNumber": currentState.phoneNumber as Any,
                "name": currentState.name as Any
            ]
            
            return Observable
                .just(Void())
                .flatMapLatest { self.apiService.postRxRequest(stringUrl: Constant.APIURL.login, parameter: parameter, type: APIResponse<User>.self)}
                .flatMap{ response -> Observable<Mutation> in
                    if response.status == 200 {
                        let accessToken = response.data?.accessToken ?? ""
                        UserDefaults.standard.set(accessToken, forKey: Constant.UDKey.accessToken)
                        UserDefaults.standard.set(name, forKey: Constant.UDKey.userName)
                        UserDefaults.standard.set(phoneNumber, forKey: Constant.UDKey.userPhoneNumber)
                        
                        return Observable.concat([
                            .just(Mutation.setIsPresentMainVC(true)),
                            .just(Mutation.setIsPresentMainVC(nil))
                        ])
                    } else {
                        let message = response.message
                        return Observable.concat([
                            .just(Mutation.setIsPresentAlertMessage(message)),
                            .just(Mutation.setIsPresentAlertMessage(nil))
                        ])
                    }
                    
                }
            
        case .didRegisterButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentRegisterVC(true)),
                .just(Mutation.setIsPresentRegisterVC(nil))
            ])
        case .didFindIdButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentFindIdVC(true)),
                .just(Mutation.setIsPresentFindIdVC(nil))
            ])
        case .didResetPwdButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentResetPwdCheckIdVC(true)),
                .just(Mutation.setIsPresentResetPwdCheckIdVC(nil))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setName(let name):
            newState.name = name
        case .setPhoneNumber(let number):
            newState.phoneNumber = number
        case .setIsLoginButtonEnabled(let isEnabled):
            newState.isLoginButtonEnabled = isEnabled
            
            
        case .setIsPresentRegisterVC(let isPresent):
            newState.isPresentRegisterVC = isPresent
        case .setIsPresentFindIdVC(let isPresent):
            newState.isPresentFindIdVC = isPresent
        case .setIsPresentResetPwdCheckIdVC(let isPresent):
            newState.isPresentResetPwdCheckIdVC = isPresent
            
        case .setIsPresentMainVC(let isPresent):
            newState.isPresentMainVC = isPresent
            
        case .setIsPresentAlertMessage(let message):
            newState.isPresentAlertMessage = message
        }
        
        return newState
    }
}
