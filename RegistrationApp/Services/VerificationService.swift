//
//  VerificationService.swift
//  RegistrationFlow
//
//  Created by Martynov Evgeny on 24.06.21.
//

import Foundation

enum PasswordStrength: Int {
    case veryWeak
    case weak
    case notVeryWeak
    case notVeryStrong
    case strong
}

final class VerificationService {

    static let weakRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    static let notVeryWeakRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    static let notVeryStrongRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    static let strongRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"

    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    static func isValidPassword(pass: String) -> PasswordStrength {
        if NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: pass) {
            return .strong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex).evaluate(with: pass) {
            return .notVeryStrong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex).evaluate(with: pass) {
            return .notVeryWeak
        } else if NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: pass) {
            return .weak
        } else {
            return .veryWeak
        }
    }

    static func isPasswordPasswordWeakRegex(pass: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", weakRegex)
        return passwordCheck.evaluate(with: pass)
    }
    
    static func isPasswordPasswordNotVeryWeakRegex(pass: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex)
        return passwordCheck.evaluate(with: pass)
    }
    
    static func isPasswordPasswordNotVeryStrongRegex(pass: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex)
        return passwordCheck.evaluate(with: pass)
    }
    
    static func isPasswordPasswordStrongRegex(pass: String) -> Bool {
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", strongRegex)
        return passwordCheck.evaluate(with: pass)
    }

    static func isPassCofirm(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }
}
