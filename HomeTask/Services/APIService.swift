//
//  APIService.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ jsonResponse: Data?, _ error: RequestError?) -> Void
typealias ResultHandler = (_ status: RequestStatus?) -> Void

enum RequestStatus {
    case success(Any?)
    case fail(RequestError)
}

protocol APIService {
    func networkRequest(_ config: APIConfig, completionHandler: @escaping CompletionHandler)
}

extension APIService {
    func networkRequest(_ config: APIConfig, completionHandler: @escaping CompletionHandler) {
        URLCache.shared.removeAllCachedResponses()
        guard let url = config.fullUrl else {
            completionHandler(nil, RequestError("Url is nil."))
            return
        }
        
        let url2 = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        
        let task = URLSession.shared.dataTask(with: url2) { (data, response, error) in
            if let error = error {
                return completionHandler(nil, RequestError(error.localizedDescription))
            }
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                }
            }
            completionHandler(data, nil)
        }
        task.resume()
    }
}

struct RequestError : LocalizedError {

    var errorDescription: String? { return mMsg }
    var failureReason: String? { return "" }
    var recoverySuggestion: String? { return "" }
    var helpAnchor: String? { return "" }

    private var mMsg : String

    init(_ description: String) {
        mMsg = description
    }
}
