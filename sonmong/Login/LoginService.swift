//
//  LoginService.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
class LoginService {
    func checkEmailValidation( _ id: String?) -> Bool? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: id)
    }
    
    func checkPwdValidation(_ pwd: String?) -> Bool? {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,50}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: pwd)
    }
}
