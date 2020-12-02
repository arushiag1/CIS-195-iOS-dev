//
//  DetailViewController.swift
//  app4_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 10/13/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    var contact: Contact = Contact(photo: nil, firstName: "first", lastName: "last", company: "company", email: "email", phoneNumber: "number")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = contact.firstName + " " + contact.lastName
        company.text = contact.company
        email.text = contact.email
        phoneNumber.text = contact.phoneNumber
        
    }
    
}
