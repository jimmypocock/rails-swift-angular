//
//  UserViewController.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import UIKit

var selectedUser = User(id: nil, firstName: nil, lastName: nil, bio: nil, phone: nil, email: nil, createdAt: nil, updatedAt: nil)

class UserViewController: UIViewController {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()

    @IBOutlet var idField: UILabel!
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var createdAtField: UILabel!
    @IBOutlet var updatedAtField: UILabel!
    @IBAction func update(sender: AnyObject) {
    }
    @IBAction func remove(sender: AnyObject) {
    }
    
    func refreshTextFields() {
        idField.text = selectedUser!.id.stringValue
        firstNameField.text = selectedUser!.firstName
        lastNameField.text = selectedUser!.lastName
        bioField.text = selectedUser!.bio
        phoneField.text = selectedUser!.phone
        emailField.text = selectedUser!.email
        createdAtField.text = selectedUser!.createdAt
        updatedAtField.text = selectedUser!.updatedAt
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()

        var apiURL = NSURL(string: "/users/\(selectedUserId)", relativeToURL: API().url!)
        API.loadDataFromURL(apiURL!, completion: { (data, error) -> Void in
            if error != nil {
                println("user show load data error")
                println(error)
            } else {
                API.parseJSON(data!, completion: { (jsonData, jsonError) -> Void in
                    if jsonError != nil {
                        println("user show parse json error")
                        println(jsonError)
                    } else {
                        var user = jsonData!["user"] as! NSDictionary
                        selectedUser = User(
                            id: user["id"] as? NSNumber,
                            firstName: user["first_name"] as? String,
                            lastName: user["last_name"] as? String,
                            bio: user["bio"] as? String,
                            phone: user["phone"] as? String,
                            email: user["email"] as? String,
                            createdAt: user["created_at"] as? String,
                            updatedAt: user["updated_at"] as? String
                        )

                        self.refreshTextFields()

                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    }
                })
            }
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
