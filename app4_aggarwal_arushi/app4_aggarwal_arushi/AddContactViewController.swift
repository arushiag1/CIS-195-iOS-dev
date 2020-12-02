//
//  AddContactViewController.swift
//  app4_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 10/13/20.
//

import Foundation
import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    weak var delegate: AddContactDelegate?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Save(_ sender: Any) {
        let newContact: Contact? = createNewContact()
        if newContact != nil {
            self.delegate?.didCreate(newContact!)
        }
        //dismiss(animated: true, completion: nil)
    }
    
    func createNewContact() -> Contact? {
        let contact: Contact? = Contact(photo: nil, firstName: firstName.text!, lastName: lastName.text!, company: company.text!, email: email.text!, phoneNumber: phoneNumber.text!) ?? nil
        return contact
    }
}
