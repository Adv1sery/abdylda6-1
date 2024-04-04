//
//  UserSessionManager.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 28/3/24.
//

import UIKit
import Foundation

protocol UserSessionManagerProtocol: AnyObject {
    func successUser(with: Person)
    func failureUser()
}

final class UserSessionManager {
    
    static let shared = UserSessionManager (
        name: "Abdylda",
        surname: "Mamashev",
        phone: "+996755880208",
        sessionCreationDate: Date())
    
    weak var controller: UserSessionManagerProtocol?
    
    private let name: String
    private let surname: String
    private let phone: String
    private let sessionCreationDate: Date
    
    init(name: String,
         surname: String,
         phone: String,
         sessionCreationDate: Date)
    {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.sessionCreationDate = sessionCreationDate
    }
    
    func isSessionActive(
        name: String,
        surname: String) -> Bool
    {
        if name == self.name && surname == self.surname {
            controller?.successUser(with: Person(name: name,
                                                 surname: surname,
                                                 phone: phone))
            return true
        } else {
            controller?.failureUser()
            return false
        }
    }
    
}

