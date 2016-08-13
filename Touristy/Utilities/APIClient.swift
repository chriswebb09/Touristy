//
//  APIClient.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


protocol Routable {
    var method: String { get }
}

enum MethodRouter: Routable {
    case GET, POST
    var method: String {
        switch self {
        case POST: return "POST"
        case GET: return "GET"
        }
    }
}

protocol Request {
    var method:String { get }
    var baseURL: String { get }
    var URLPath: String { get }
    var parameters: Dictionary<String, String> { get }
    var headers: Dictionary<String, String> { get }
}

struct GetRequest: Request {
    var method: String { return MethodRouter.GET.method }
    var baseURL: String
    var URLPath: String
    var parameters: Dictionary<String, String>
    var headers: Dictionary<String, String>
    
    init(baseURL: String, URLPath:String, parameters: Dictionary<String, String>, headers:Dictionary<String, String>) {
        self.baseURL = baseURL
        self.URLPath = URLPath
        self.parameters = parameters
        self.headers = headers
    }
    
    func buildRequest() -> NSURLRequest? {
        guard let baseURL = NSURL(string: self.baseURL + self.URLPath) else { return nil }
        guard let URLComponents = NSURLComponents(URL: baseURL, resolvingAgainstBaseURL: true) else { return nil }
        guard let URL = URLComponents.URL else { return nil }
        let request = NSMutableURLRequest(URL:URL)
        request.HTTPMethod = method
        return request
    }
}