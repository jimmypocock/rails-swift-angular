//
//  API.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import Foundation

var users = []
var currentUser = User(firstName: nil, lastName: nil, bio: nil, phone: nil, email: nil, createdAt: nil, updatedAt: nil)

class API {

    let url = NSURL(string: "http://localhost:3000")

    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var session = NSURLSession.sharedSession()
        let loadDataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if let responseError = error {
                completion(data: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: error)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        loadDataTask.resume()
    }

    class func parseJSON(data: NSData, completion:(response: NSDictionary?, error: NSError?) -> Void) {
        var error: NSError?
        var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &error) as? NSDictionary
        if let jsonError = error {
            completion(response: nil, error: error)
        } else {
            completion(response: json, error: nil)
        }
    }
}
