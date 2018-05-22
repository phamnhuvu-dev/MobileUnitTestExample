//
//  LoginViewModel.swift
//  iOSUnitTestSample
//
//  Created by Phạm Như Vũ on 5/19/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import RxSwift

class LoginViewModel {
    
    enum Message {
        case EMPTY_EMAIL
        case INVALID_EMAIL
        case EMPTY_PASSWORD
        case SHORT_PASSWORD
    }
    
//    public let EMPTY_EMAIL: String = "empty_email"
//    public let INVALID_EMAIL: String = "invalid_email"
//    public let EMPTY_PASSWORD: String = "empty_password"
//    public let SHORT_PASSWORD: String = "short_password"
    
    public func login(email: String, password: String) -> Observable<Message>{
        return Observable<Message>.create({ subscribe in
            var complete = true
            
            let messageCheckEmail = self.checkEmail(email)
            if messageCheckEmail != nil {
                complete = false
                subscribe.onNext(messageCheckEmail!)
            }
            
            let messageCheckPassword = self.checkPassword(password)
            if messageCheckPassword != nil {
                complete = false
                subscribe.onNext(messageCheckPassword!)
            }
            
            if complete { subscribe.onCompleted()}
            return Disposables.create()
        })
    }
    
    func isEmailInvalidator(_ email: String) -> Bool {
        let pattern = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: email, options: [], range: NSRange(location: 0, length: email.count))
        return matches.count == 1
    }
    
    func checkEmail(_ email: String) -> Message? {
        var result: Message? = nil
        if email.isEmpty {
            result = Message.EMPTY_EMAIL
        } else if !isEmailInvalidator(email) {
            result = Message.INVALID_EMAIL
        }
        return result
    }
    
    func checkPassword(_ password: String) -> Message? {
        var result: Message? = nil
        if password.isEmpty {
            result = Message.EMPTY_PASSWORD
        } else if password.count < 6 {
            result = Message.SHORT_PASSWORD
        }
        return result
    }
}
