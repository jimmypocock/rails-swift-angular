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
        var params = [
            "user": [
                "first_name":firstNameField.text,
                "last_name":lastNameField.text,
                "bio":bioField.text,
                "phone":phoneField.text,
                "email":emailField.text,
            ]
        ] as NSDictionary
        var apiURL = NSURL(string: "/users/\(selectedUserId)", relativeToURL: API().url!)
        API.PUT(apiURL!, params: params, completion: { (data, error) -> Void in
            if error != nil {
                println("user update load data error")
                println(error)
            } else {
                API.parseJSON(data!, completion: { (jsonData, jsonError) -> Void in
                    if jsonError != nil {
                        println("user update parse json error")
                        println(jsonError)
                    } else {
                        println("json data")
                        println(jsonData)

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
    @IBAction func remove(sender: AnyObject) {
        var apiURL = NSURL(string: "/users/\(selectedUserId)", relativeToURL: API().url!)
        API.DELETE(apiURL!, completion: { (data, error) -> Void in
            if error != nil {
                println("user remove load data error")
                println(error)
            } else {
                println("successful delete")
                self.performSegueWithIdentifier("UserDeleted", sender: self)
            }
        })
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
        API.GET(apiURL!, completion: { (data, error) -> Void in
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
