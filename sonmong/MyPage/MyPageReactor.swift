//
//  MyPageReactor.swift
//  sonmong
//
//  Created by 이은솔 on 5/15/24.
//

import Foundation
import Foundation
import ReactorKit
import RxSwift

class MyPageReactor: Reactor {
    
    enum Action {
        case viewDidLoaded
        case didManageAccontSelected(MyPageServies?)
        case didTermAndPolicySelected(MyPageServies?)
        case didLogOutAlertConfirmButtonTapped
        case didWithdrawAlertConfirmButtonTapped
    }
    
    enum Mutation {
        case setIsLoginStatus(Bool?)
        case setUserName(String?)
        case setUserPhoneNumber(String?)
        
        case setIsPresentLogOutAlert(Bool?)
        case setIsPresentWithdrawalAlert(Bool?)
        case setIsPresentPrivacyPolicyVC(Bool?)
        case setIsPresentTermsOfServiceVC(Bool?)
        case setIsPresentLoginVC(Bool?)
        case setAlertMessage(String?)
    }
    
    struct State {
        var isLoginStatus: Bool?
        var userName: String?
        var userPhoneNumber: String?
        
        var manageAccountTableViewDataSource: [MyPageServies]? = [
            MyPageServies(title: "로그아웃", iconName: "chevron-forward-outline"),
            MyPageServies(title: "회원 탈퇴하기", iconName: "chevron-forward-outline")]
        var termAndPoliciesTableViewDataSource: [MyPageServies]? = [
            MyPageServies(title: "개인정보 처리방침", iconName: "chevron-forward-outline"),
            MyPageServies(title: "서비스 이용약관", iconName: "chevron-forward-outline")
        ]
        
        
        var isPresentLogOutAlert: Bool?
        var isPresentWithdrawalAlert: Bool?
        var isPresentPrivacyPolicyVC: Bool?
        var isPresentTermsOfServiceVC: Bool?
        var isPresentLoginVC: Bool?
        var alertMessage: String?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: MyPageReactor.Action) -> Observable<MyPageReactor.Mutation> {
        switch action {
        case .viewDidLoaded:
            let accessToken = UserDefaults.standard.object(forKey: Constant.UDKey.accessToken)
            
            if accessToken == nil {
                return Observable.concat([
                    .just(Mutation.setIsLoginStatus(false))
                ])
            } else {
                let userName = UserDefaults.standard.object(forKey: Constant.UDKey.userName) as! String?
                let userPhoneNumber = UserDefaults.standard.object(forKey: Constant.UDKey.userPhoneNumber) as! String?
                return Observable.concat([
                    .just(Mutation.setIsLoginStatus(true)),
                    .just(Mutation.setUserName(userName)),
                    .just(Mutation.setUserPhoneNumber(userPhoneNumber))
                ])
            }
            
        case .didManageAccontSelected(let selectedMenu):
            if selectedMenu?.title == "로그아웃" {
                return Observable.concat([
                    .just(Mutation.setIsPresentLogOutAlert(true)),
                    .just(Mutation.setIsPresentLogOutAlert(nil))
                ])
            } else if selectedMenu?.title == "회원 탈퇴하기" {
                return Observable.concat([
                    .just(Mutation.setIsPresentWithdrawalAlert(true)),
                    .just(Mutation.setIsPresentWithdrawalAlert(nil))
                ])
            } else {
                let message = "문제가 발생했습니다.\n관리자에게 문의해주세요."
                return Observable.concat([
                    .just(Mutation.setAlertMessage(message)),
                    .just(Mutation.setAlertMessage(nil))
                ])
            }
            
        case .didTermAndPolicySelected(let selectedMenu):
            if selectedMenu?.title == "개인정보 처리방침" {
                return Observable.concat([
                    .just(Mutation.setIsPresentPrivacyPolicyVC(true)),
                    .just(Mutation.setIsPresentPrivacyPolicyVC(nil))
                ])
            } else if selectedMenu?.title == "서비스 이용약관" {
                return Observable.concat([
                    .just(Mutation.setIsPresentTermsOfServiceVC(true)),
                    .just(Mutation.setIsPresentTermsOfServiceVC(nil))
                ])
            } else {
                let message = "문제가 발생했습니다.\n관리자에게 문의해주세요."
                return Observable.concat([
                    .just(Mutation.setAlertMessage(message)),
                    .just(Mutation.setAlertMessage(nil))
                ])
            }
            
        case .didLogOutAlertConfirmButtonTapped:
            // UserDefaults의 모든 데이터 삭제
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            
            return Observable.concat([
                .just(Mutation.setIsPresentLoginVC(true)),
                .just(Mutation.setIsPresentLoginVC(nil))
            ])
            
        case .didWithdrawAlertConfirmButtonTapped:
            // UserDefaults의 모든 데이터 삭제
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            
            return Observable.concat([
                .just(Mutation.setIsPresentLoginVC(true)),
                .just(Mutation.setIsPresentLoginVC(nil))
            ])
            
            
            
        }
    }
    
    func reduce(state: MyPageReactor.State, mutation: MyPageReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .setIsLoginStatus(let isLogin):
            newState.isLoginStatus = isLogin
        case .setUserName(let name):
            newState.userName = name
        case .setUserPhoneNumber(let number):
            newState.userPhoneNumber = number
            
            
        case .setIsPresentLogOutAlert(let isPresent):
            newState.isPresentLogOutAlert = isPresent
        case .setIsPresentWithdrawalAlert(let isPresent):
            newState.isPresentWithdrawalAlert = isPresent
        case .setIsPresentPrivacyPolicyVC(let isPresent):
            newState.isPresentPrivacyPolicyVC = isPresent
        case .setIsPresentTermsOfServiceVC(let isPresent):
            newState.isPresentTermsOfServiceVC = isPresent
        case .setIsPresentLoginVC(let isPresent):
            newState.isPresentLoginVC = isPresent
        case .setAlertMessage(let message):
            newState.alertMessage = message
        }
        
        return newState
    }
}
