//
//  UserCreateViewController.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/13/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import UIKit

class UserCreateViewController: UIViewController {

    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBAction func create(sender: AnyObject) {
        var params = [
            "user": [
                "first_name":firstNameField.text,
                "last_name":lastNameField.text,
                "bio":bioField.text,
                "phone":phoneField.text,
                "email":emailField.text,
            ]
        ] as NSDictionary
        var apiURL = NSURL(string: "/users", relativeToURL: API().url!)
        API.POST(apiURL!, params: params, completion: { (data, error) -> Void in
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
                        selectedUserId = user["id"] as! NSNumber
                        println("successfully created")
                        self.performSegueWithIdentifier("UserCreated", sender: self)
                    }
                })
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
