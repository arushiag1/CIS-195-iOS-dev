//
//  Contact.swift
//  app4_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 10/13/20.
//

import UIKit

class Contact {
    
    var photo: UIImage?
    var firstName: String
    var lastName: String
    var company: String
    var email: String
    var phoneNumber: String
    
    init?(photo: UIImage?, firstName: String, lastName: String, company: String, email: String, phoneNumber: String) {
        
        guard !firstName.isEmpty && !lastName.isEmpty && !company.isEmpty && !email.isEmpty && !phoneNumber.isEmpty else {
            return nil;
        }
        
        self.photo = photo
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
