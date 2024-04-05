//
//  User.swift
//  Agilo
//
//  Created by Pavly Paules on 04/04/2024.
//

import Foundation

class User: Identifiable, Codable {
     let id : String
     let fullName: String
     let email: String
     var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            //So this will look after FullName and will divide it up and give us the initials (First two letters)
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    init(id: String, fullName: String, email: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
    }
}

extension User {
    static var Mock_USER = User(id: NSUUID().uuidString, fullName: "Pavly Paules", email: "test@gmail.com")
}
