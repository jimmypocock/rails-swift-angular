//
//  API.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import Foundation

class API {

    let url = NSURL(string: "http://localhost:3000")

    class func loadDataFromURL(url: NSURL, method: String, params: NSDictionary?, completion:(data: NSData?, error: NSError?) -> Void) {
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = method
        if params != nil {
            var err: NSError?
            request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params!, options: nil, error: &err)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var session = NSURLSession.sharedSession()
        let loadDataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if let responseError = error {
                completion(data: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.jimmy-pocock", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: error)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        loadDataTask.resume()
    }

    class func GET(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        API.loadDataFromURL(url, method: "GET", params: nil) { (data, error) -> Void in
            if error != nil {
                completion(data: nil, error: error)
            } else {
                completion(data: data, error: error)
            }
        }
    }

    class func POST(url: NSURL, params: NSDictionary, completion:(data: NSData?, error: NSError?) -> Void) {
        API.loadDataFromURL(url, method: "POST", params: params) { (data, error) -> Void in
            if error != nil {
                completion(data: nil, error: error)
            } else {
                completion(data: data, error: error)
            }
        }
    }

    class func PUT(url: NSURL, params: NSDictionary, completion:(data: NSData?, error: NSError?) -> Void) {
        API.loadDataFromURL(url, method: "PUT", params: params) { (data, error) -> Void in
            if error != nil {
                completion(data: nil, error: error)
            } else {
                completion(data: data, error: error)
            }
        }
    }

    class func DELETE(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        API.loadDataFromURL(url, method: "DELETE", params: nil) { (data, error) -> Void in
            if error != nil {
                completion(data: nil, error: error)
            } else {
                completion(data: data, error: error)
            }
        }
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
