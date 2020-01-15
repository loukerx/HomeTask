//
//  MainViewModel.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

class MainViewModel {
    var updatedUI: ((_ response: Response?, _ error: RequestError?) -> Void)?
    private var apiService: APIService!
    
    init(_ apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchCanadaDetails() {
        apiService.fetchCanadaDetail(EndPoint.canada) { [weak self] status in
            guard let self = self else { return }
            guard let status = status else {
                return
            }
            switch status {
            case .success(let result):
                if let response = result as? Response {
                    self.updatedUI?(response, nil)
                } else {
                    self.updatedUI?(nil, RequestError("No data"))
                }

            case .fail(let error):
                self.updatedUI?(nil, RequestError(error.errorDescription ?? "Unknown Error"))
            }
        }
    }
}

