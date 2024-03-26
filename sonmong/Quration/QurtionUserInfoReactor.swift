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
        case didPreviousButtonTapped
        case didNextButtonTapped
    }
    
    enum Mutation {
        case setBirthday(String?)
        case setGender(String)
        case setJobOrHobbyDataSource([PainAreaCollectionViewCellReactor]?)
        
        case setIsPresentPreviousVC(Bool?)
        case setIsPresentNextVC(Bool?)
    }
    
    struct State {
        var birthday: String?
        var gender: String?
        var jobOrHobbyDataSource: [PainAreaCollectionViewCellReactor]?
        
        var isPresentPreviousVC: Bool?
        var isPresentNextVC: Bool?
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoaded:
            return Observable.concat([
            
            ])
            
        case .didBirthdayPickerChanged(let inputDate):
            return Observable.concat([
                .just(Mutation.setBirthday(inputDate?.toString(withFormat: "yyyy.MM.dd")))
            ])
            
        case .didGenderGirlButtonTapped:
            return Observable.concat([
                .just(Mutation.setGender("W"))
            ])
            
        case .didGenderBoyButtonTapped:
            return Observable.concat([
                .just(Mutation.setGender("M"))
            ])
            
        case .didJobOrHabbyTextFieldChanged(let inputData):
            var currentDataSource = currentState.jobOrHobbyDataSource ?? []
            let newCellReactor = PainAreaCollectionViewCellReactor(title: inputData, isSelected: true, isCustom: false)
            
            currentDataSource.append(newCellReactor)
            currentDataSource = currentDataSource.filter { $0 != nil }
            return Observable.concat([
                .just(Mutation.setJobOrHobbyDataSource(currentDataSource))
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
        case .setBirthday(let date):
            newState.birthday = date
        case .setGender(let gender):
            newState.gender = gender
        case .setJobOrHobbyDataSource(let dataSource):
            newState.jobOrHobbyDataSource = dataSource
            
        case .setIsPresentPreviousVC(let isPresent):
            newState.isPresentPreviousVC = isPresent
        case .setIsPresentNextVC(let isPresent):
            newState.isPresentNextVC = isPresent
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
