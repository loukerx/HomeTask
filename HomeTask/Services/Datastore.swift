//
//  Datastore.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

class DataStore: APIService {

    func fetchCanadaDetail(_ config: APIConfig, resultHandler: @escaping ResultHandler) {
        guard let endPoint = config as? EndPoint else {
            return resultHandler(.fail(RequestError("Couldn't find server.")))
        }

        networkRequest(endPoint) { data, error in
            if let error = error {
                return resultHandler(.fail(error))
            }
            guard let data = data else {
                return resultHandler(.fail(RequestError("Empty data.")))
            }
            do {
                let decoder = JSONDecoder()
                let canada = try decoder.decode(Response.self, from: data)
                
                resultHandler(.success(canada))
            } catch {
                resultHandler(.fail(RequestError("Couldn't parse data.")))
            }
        }
    }
}
