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
        case didIdTextFieldChanged(String?)
        case didPwdTextFieldChanged(String?)
        case didIconButtonTapped
        case didLoginButtonTapped
        case didRegisterButtonTapped
        case didFindIdButtonTapped
        case didResetPwdButtonTapped
    }
    
    enum Mutation {
        case setId(String?)
        case setIdSubTitleIsHidden(Bool?)
        case setPwd(String?)
        case setPwdSubTitleIsHidden(Bool?)
        case setPwdSubTitleMessage(String?)
        case setIsIconEyeOn(Bool?)
        case setIsLoginButtonEnabled(Bool?)
        
        case setIsPresentRegisterVC(Bool?)
        case setIsPresentFindIdVC(Bool?)
        case setIsPresentResetPwdCheckIdVC(Bool?)
        
        case setIsPresentMainVC(Bool?)
        case setIsPresentPlatformMainVC(Bool?)
        
        case setIsPresentAlertMessage(String?)
    }
    
    struct State {
        var id: String?
        var idSubTitleIsHidden: Bool?
        var pwd: String?
        var pwdSubTitleIsHidden: Bool?
        var pwdSubTitleMessage: String?
        var isIconEyeOn: Bool?
        var isLoginButtonEnabled: Bool? = false
        
        var isPresentRegisterVC: Bool?
        var isPresentFindIdVC: Bool?
        var isPresentResetPwdCheckIdVC: Bool?
        
        var isPresentMainVC: Bool?
        var isPresentPlatformMainVC: Bool?
        
        var isPresentAlertMessage: String?
    }
    
    let initialState = State()
    let service = LoginService()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didIdTextFieldChanged(let inputId):
            let isEmail = service.checkEmailValidation(inputId)
            if isEmail == false {
                return Observable.concat([
                    .just(Mutation.setIdSubTitleIsHidden(false)),
                    .just(Mutation.setIsLoginButtonEnabled(false))
                ])
            }
            
            let pwd = currentState.pwd
            if pwd == nil || pwd == "" {
                return Observable.concat([
                    .just(Mutation.setIdSubTitleIsHidden(true)),
                    .just(Mutation.setIsLoginButtonEnabled(false)),
                    .just(Mutation.setId(inputId))
                ])
            } else {
                return Observable.concat([
                    .just(Mutation.setIdSubTitleIsHidden(true)),
                    .just(Mutation.setIsLoginButtonEnabled(true)),
                    .just(Mutation.setId(inputId))
                ])
            }
            
        case .didPwdTextFieldChanged(let inputPwd):
            if inputPwd == "" {
                return Observable.concat([
                    .just(Mutation.setPwdSubTitleIsHidden(false)),
                    .just(Mutation.setPwdSubTitleMessage("비밀번호를 입력하세요.")),
                    .just(Mutation.setIsIconEyeOn(false)),
                    .just(Mutation.setIsLoginButtonEnabled(false))
                ])
            }
            
            let isPwdRule = service.checkPwdValidation(inputPwd)
            if isPwdRule == false {
                return Observable.concat([
                    .just(Mutation.setPwdSubTitleIsHidden(false)),
                    .just(Mutation.setPwdSubTitleMessage("비밀번호는 8~12자리 영문, 숫자, 특수문자 조합입니다.")),
                    .just(Mutation.setIsLoginButtonEnabled(false))
                ])
            }
        
            let id = currentState.id
            if id == "" || id == nil {
                return Observable.concat([
                    .just(Mutation.setPwdSubTitleIsHidden(true)),
                    .just(Mutation.setIsLoginButtonEnabled(false)),
                    .just(Mutation.setPwd(inputPwd))
                ])
            } else {
                return Observable.concat([
                    .just(Mutation.setPwdSubTitleIsHidden(true)),
                    .just(Mutation.setIsLoginButtonEnabled(true)),
                    .just(Mutation.setPwd(inputPwd))
                ])
            }
        case.didIconButtonTapped:
            let eyeOnOff = currentState.isIconEyeOn == true ? false : true
            return Observable.concat([
                .just(Mutation.setIsIconEyeOn(eyeOnOff))
            ])
            
        case .didLoginButtonTapped:
            let parameter = [
                "userId": currentState.id as Any,
                "userPwd": currentState.pwd as Any
            ]
            
            return Observable.empty()
            
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
        case .setId(let id):
            newState.id = id
        case .setIdSubTitleIsHidden(let isHidden):
            newState.idSubTitleIsHidden = isHidden
        case .setPwd(let pwd):
            newState.pwd = pwd
        case .setPwdSubTitleIsHidden(let isHidden):
            newState.pwdSubTitleIsHidden = isHidden
        case .setPwdSubTitleMessage(let message):
            newState.pwdSubTitleMessage = message
        case .setIsIconEyeOn(let isHidden):
            newState.isIconEyeOn = isHidden
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
        case .setIsPresentPlatformMainVC(let isPresent):
            newState.isPresentPlatformMainVC = isPresent
            
        case .setIsPresentAlertMessage(let message):
            newState.isPresentAlertMessage = message
        }
        
        return newState
    }
}
