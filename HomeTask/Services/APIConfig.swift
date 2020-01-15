//
//  APIConfig.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

protocol APIConfig {
    var urlScheme: String? { get }
    var baseURL: String? { get }
    var path: String? { get }
    var method: String? { get }
    var header: [String: Any]? { get }
    var parameters: [String: Any]? { get }
    var fullUrl: URL? { get }
}

// https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json
enum EndPoint: APIConfig {

    case canada

    var urlScheme: String? {
        switch self {
        case .canada:
            return "https"
        }
    }

    var baseURL: String? {
        switch self {
        case .canada:
            return "dl.dropboxusercontent.com"
        }
    }

    var path: String? {
        switch self {
        case .canada:
            return "/s/2iodh4vg0eortkl/facts.json"
        }
    }

    var method: String? {
        switch self {
        case .canada:
            return "GET"
        }
    }

    var header: [String: Any]? {
        switch self {
        case .canada:
            return nil
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .canada:
            return nil
        }
    }

    var fullUrl: URL? {
        switch self {
        case .canada:
            guard let baseUrl = baseURL,
                let path = path else { return nil }

            var components = URLComponents()
            components.scheme = urlScheme
            components.host = baseUrl
            components.path = path

            if let parameters = parameters,
                !parameters.isEmpty {
                components.queryItems = [URLQueryItem]()
                for (key, value) in parameters {
                    let queryItem = URLQueryItem(name: key, value: "\(value)")
                    components.queryItems!.append(queryItem)
                }
            }

            return components.url
        }
    }

}
