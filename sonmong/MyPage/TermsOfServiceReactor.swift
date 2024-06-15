//
//  TermsOfServiceReactor.swift
//  sonmong
//
//  Created by 이은솔 on 6/15/24.
//

import Foundation
import Foundation
import ReactorKit
import RxSwift

class TermsOfServiceReactor: Reactor {
    
    enum Action {
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var content = "몽지 이용약관\n\n몽지는 모바일에서 회원에게 문답작성으로 실시간 손목통증 상담을 제공하는 서비스입니다. 해당 이용약관에서 '회사'란 '몽지'서비스를 제공하는 '몽지'를 말합니다.\n\n귀하와 몽지의 관계\n본 이용약관(이하 “약관”)은 몽지가 제공하는 애플리케이션, 웹사이트, 콘텐츠, 제품 및 서비스(이하 “서비스”)에 대한 귀하 개인의 액세스 또는 사용을 규율합니다. 서비스에 액세스하거나 사용하기 전에 이 약관을 주의깊게 읽으십시오. 본 약관에서 “포함” 및 “포함한다”는 “포함하되 이에 국한되지 않음”을 의미합니다. \n서비스에 대한 액세스와 사용은 본 약관에 동의한다는 것으로 간주됩니다. 본 약관에 동의하지 않으면 서비스에 액세스하거나 사용할 수 없습니다. 본 약관은 명시적으로 귀하와의 이전 계약 또는 약정을 대체합니다. 플랜핏은 귀하에 대한 본 약관 또는 서비스를 즉시 종료하거나 일반적으로 서비스 또는 그 일부에 대한 제공을 일반적으로 중단하거나 어떤 이유로든 언제든지 액세스를 거부할 수 있습니다.\n몽지는 서비스와 관련된 약관을 수시로 개정할 수 있으며 개정된 내용을 시행 7일 전에 공지할 수 있습니다. 귀하에게 불리한 영향을 미치는 수정 사항이 있을 경우 이를 최소 30일 전에 고지합니다. 고지 이후에도 서비스에 지속적으로 접근 및 사용하는 것은 개정된 약관에 동의한다는 것으로 간주됩니다.\n\n정의\n1) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. \n(1) '회사'란 서비스를 제공하는 주체(몽지)를 말합니다.\n(2) '서비스'란 회사가 제공하는 모든 서비스 및 기능을 말합니다.\n(3) '회원'이란 서비스에 회원가입을 하고 서비스를 이용하는 자를 말합니다.\n2) 1항에서 정의되지 않은 약관 내 용어의 의미는 일반적인 이용관행에 의합니다.\n몽지서비스\n"
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: TermsOfServiceReactor.Action) -> Observable<TermsOfServiceReactor.Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: TermsOfServiceReactor.State, mutation: TermsOfServiceReactor.Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        
        return newState
    }
}
