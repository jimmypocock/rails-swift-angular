//
//  UserViewController.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet var idField: UITextField!
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var createdAtField: UITextField!
    @IBOutlet var updatedAtField: UITextField!
    @IBAction func update(sender: AnyObject) {
    }
    @IBAction func remove(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        var model: AnyObject = users[currentUserIndex]
        var firstName = model["first_name"] as! String
        var lastName = model["last_name"] as! String
        var bio = model["bio"] as! String
        var phone = model["phone"] as! String
        var email = model["email"] as! String
        var createdAt = model["created_at"] as! String
        var updatedAt = model["updated_at"] as! String
        var user = UserModel(firstName: firstName, lastName: lastName, bio: bio, phone: phone, email: email, createdAt: createdAt, updatedAt: updatedAt);

        firstNameField.text = firstName
        lastNameField.text = lastName
        bioField.text = bio
        phoneField.text = phone
        emailField.text = email
        createdAtField.text = createdAt
        updatedAtField.text = updatedAt

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
