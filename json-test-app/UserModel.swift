//
//  UserModel.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import Foundation

class User {
    
    var firstName: String
    var lastName: String
    var bio: String
    var phone: String
    var email: String
    var createdAt: String
    var updatedAt: String

    var description: String {
        return "First Name: \(firstName), Last Name: \(lastName), Bio: \(bio), Phone: \(phone), Email: \(email), Created At: \(createdAt), Updated At: \(updatedAt)"
    }

    init?(firstName: String?, lastName: String?, bio: String?, phone: String?, email: String?, createdAt: String?, updatedAt: String?) {

        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
        self.bio = bio ?? ""
        self.phone = phone ?? ""
        self.email = email ?? ""
        self.createdAt = createdAt ?? ""
        self.updatedAt = updatedAt ?? ""
        return nil
    }

}
