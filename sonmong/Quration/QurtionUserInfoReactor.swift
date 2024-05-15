//
//  QurationUserInfoReactor.swift
//  sonmong
//
//  Created by 이은솔 on 3/24/24.
//

import Foundation
import Foundation
import RxSwift
import ReactorKit

class QurationUserInfoReactor: Reactor {
    enum Action {
        case viewDidLoaded
        case didBirthdayPickerChanged(Date?)
        case didGenderGirlButtonTapped
        case didGenderBoyButtonTapped
        case didJobOrHabbyTextFieldChanged(String?)
        case didJobORHobbyButtonTapped
        case didJobOrHobbySelected(PainAreaCollectionViewCellReactor)
        case didPreviousButtonTapped
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setQurationParameter(Quration?)
        case setBirthday(String?)
        case setGender(Bool?)
        case setJobOrHobbyDataSource([PainAreaCollectionViewCellReactor]?)
        case setInputJobOrHobbyData(String?)
        case setSelectedJobOrHobby([String]?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
        
        case setIsNextButtonEnabled(Bool?)
        case setIsPresentAlertMesasge(String?)
    }
    
    struct State {
        var qurationParameter: Quration?
        var birthday: String?
        var gender: Bool?
        var jobOrHobbyDataSource: [PainAreaCollectionViewCellReactor]? = []
        var inputJobOrHobbyData: String?
        var selectedJobOrHobby: [String]?
        
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
        
        var isNextButtonEnabled: Bool?
        var isPresentAlertMesasge: String?
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoaded:
            return Observable.concat([
            
            ])
            
        case .didBirthdayPickerChanged(let inputDate):
            var isNextButtonEnabled: Bool? = false
            if let gender = currentState.gender {
                if let selectedJobOrHobby = currentState.selectedJobOrHobby, selectedJobOrHobby.count > 0 {
                    isNextButtonEnabled = true
                }
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setBirthday(inputDate?.toString(withFormat: "yyyy.MM.dd")))
            ])
            
        case .didGenderGirlButtonTapped:
            var isNextButtonEnabled: Bool? = false
            if let birthday = currentState.birthday {
                if let selectedJobOrHobby = currentState.selectedJobOrHobby, selectedJobOrHobby.count > 0 {
                    isNextButtonEnabled = true
                }
            }
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setGender(true))
            ])
            
        case .didGenderBoyButtonTapped:
            var isNextButtonEnabled: Bool? = false
            if let birthday = currentState.birthday {
                if let selectedJobOrHobby = currentState.selectedJobOrHobby, selectedJobOrHobby.count > 0 {
                    isNextButtonEnabled = true
                }
            }
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setGender(false))
            ])
            
        case .didJobOrHabbyTextFieldChanged(let inputData):
            return Observable.concat([
                .just(Mutation.setInputJobOrHobbyData(inputData))
            ])
            
        case .didJobORHobbyButtonTapped:
            var isNextButtonEnabled: Bool? = false
            
            let currentUserInputData = currentState.inputJobOrHobbyData ?? ""
            if currentUserInputData == "" {
                return Observable.empty()
            }
            
            var currentJobOrHobbyDataSource = currentState.jobOrHobbyDataSource ?? []
            let isDuplicate = currentJobOrHobbyDataSource.contains(where: { $0.currentState.title == currentUserInputData })
            
            if !isDuplicate {
                let inputPainAreaAsCellReactor = PainAreaCollectionViewCellReactor(title: currentUserInputData, isSelected: true, isCustom: true)
                currentJobOrHobbyDataSource.append(inputPainAreaAsCellReactor)
            }
            
            var currentSelectedJobOrHobby = currentState.selectedJobOrHobby ?? []
            if currentSelectedJobOrHobby.contains(currentUserInputData) == false {
                currentSelectedJobOrHobby.append(currentUserInputData)
            }
            
            if currentState.birthday != nil {
                if currentState.gender != nil {
                    if currentSelectedJobOrHobby.count > 0 {
                        isNextButtonEnabled = true
                    } else {
                        
                    }
                } else {
                    
                }
            } else {
                
            }
            
            return Observable.concat([
                .just(Mutation.setIsNextButtonEnabled(isNextButtonEnabled)),
                .just(Mutation.setSelectedJobOrHobby(currentSelectedJobOrHobby)),
                .just(Mutation.setJobOrHobbyDataSource(currentJobOrHobbyDataSource)),
                .just(Mutation.setInputJobOrHobbyData(nil))
            ])
            
        case .didJobOrHobbySelected(let inputCellReactor):
            var selectedJobOrHobby: [String]? = []
            
            let currentRecognizedDatas = currentState.jobOrHobbyDataSource?.map ({ cellReactor -> PainAreaCollectionViewCellReactor in
                if cellReactor.currentState.title == inputCellReactor.currentState.title {
                    if inputCellReactor.currentState.isSelected == true {
                        return PainAreaCollectionViewCellReactor(title: inputCellReactor.currentState.title, isSelected: false, isCustom: inputCellReactor.currentState.isCustom)
                    } else {
                        selectedJobOrHobby?.append(inputCellReactor.currentState.title ?? "")
                        return PainAreaCollectionViewCellReactor(title: inputCellReactor.currentState.title, isSelected: true , isCustom: inputCellReactor.currentState.isCustom)
                    }
                } else {
                    if cellReactor.currentState.isSelected == true {
                        selectedJobOrHobby?.append(cellReactor.currentState.title ?? "")
                    }
                    return PainAreaCollectionViewCellReactor(title: cellReactor.currentState.title, isSelected: cellReactor.currentState.isSelected, isCustom: cellReactor.currentState.isCustom)
                }
            }) ?? []
            
            print("✅ selectedJobOrHobby = \(selectedJobOrHobby)")
            
            if currentRecognizedDatas.count <= 0 {
                return Observable.concat([
                    .just(Mutation.setSelectedJobOrHobby(nil)),
                    .just(Mutation.setJobOrHobbyDataSource([])),
                    .just(Mutation.setIsNextButtonEnabled(false))
                ])
            }
            
            return Observable.concat([
                .just(Mutation.setSelectedJobOrHobby(selectedJobOrHobby)),
                .just(Mutation.setJobOrHobbyDataSource(currentRecognizedDatas))
            ])
            
        case .didPreviousButtonTapped:
            return Observable.concat([
                .just(Mutation.setIsPresentPreviousVC(true)),
                .just(Mutation.setIsPresentPreviousVC(nil))
            ])
            
        case .didNextButtonTapped:
            
            var message = ""
            var qurationParameter = Quration()
            
            if let birthday = currentState.birthday, birthday != "" {
                qurationParameter.birthday = birthday
            } else {
                message += "🌟 생년월일\n"
            }
            
            if let gender = currentState.gender {
                qurationParameter.gender = gender
            } else {
                message += "🌟 성별\n"
            }
            
            if let jobOrHobby = currentState.selectedJobOrHobby, jobOrHobby.count > 0 {
                #warning("jobOrHobby 타입 체크 후 수정")
                qurationParameter.jobOrHobby = jobOrHobby.first
            } else {
                message += "🌟 직업이나 취미\n"
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
        case .setQurationParameter(let quration):
            newState.qurationParameter = quration
        case .setBirthday(let date):
            newState.birthday = date
        case .setGender(let gender):
            newState.gender = gender
        case .setJobOrHobbyDataSource(let dataSource):
            newState.jobOrHobbyDataSource = dataSource
        case .setInputJobOrHobbyData(let data):
            newState.inputJobOrHobbyData = data
        case .setSelectedJobOrHobby(let dataSource):
            newState.selectedJobOrHobby = dataSource
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
            
        case .setIsNextButtonEnabled(let isEnabled):
            newState.isNextButtonEnabled = isEnabled
        case .setIsPresentAlertMesasge(let message):
            newState.isPresentAlertMesasge = message
        }
        return newState
    }
}

extension Date {
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // 고정된 결과를 얻기 위해 locale 설정
        dateFormatter.timeZone = TimeZone.current // 현재 시간대 사용
        return dateFormatter.string(from: self)
    }
}
