//
//  ContactsTableViewController.swift
//  app4_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 10/13/20.
//

import Foundation
import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
    
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contacts.append(contact)
        contacts.sort{$0!.firstName < $1!.firstName}
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Add(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: sender)
    }
    
    //let myContact = Contact.init(photo: <#T##UIImage?#>, firstName: "Arushi", lastName: "Aggarwal", company: "Penn", email: "arushiag@seas.upenn.edu", phoneNumber: "425-628-5747")
    
    //let friendContact = Contact.init(photo: <#T##UIImage?#>, firstName: "Anon", lastName: "Ymous", company: "Goldman Sachs", email: "corporatesellout@gmail.com", phoneNumber: "123-456-7890")
    
    //var contacts = [myContact, friendContact]
    
    var contacts = [Contact.init(photo: nil, firstName: "Arushi", lastName: "Aggarwal", company: "Penn", email: "arushiag@seas.upenn.edu", phoneNumber: "425-628-5747"), Contact.init(photo: nil, firstName: "Anony", lastName: "Mous", company: "Goldman Sachs", email: "corporatesellout@gmail.com", phoneNumber: "123-456-7890")]
    
    
    
    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath)
        /*if let label = cell.viewWithTag(1) as? UILabel {
            label.text = contacts[indexPath.row]?.firstName
        }*/
        let name: String? = contacts[indexPath.row]!.firstName + " " + contacts[indexPath.row]!.lastName
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = contacts[indexPath.row]!.company
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DetailViewController
            let indexPath = sender as! IndexPath
            vc.contact = contacts[indexPath.row]!
        }
        if segue.identifier == "toAdd" {
            let vc = segue.destination as! UINavigationController
            let tc = vc.topViewController as! AddContactViewController
            tc.delegate = self
        }
    }
}
