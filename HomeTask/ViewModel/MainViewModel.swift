//
//  MainViewModel.swift
//  HomeTask
//
//  Created by Yin Hua on 15/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private var apiService: APIService!
    
    init(_ apiService: APIService) {
        self.apiService = apiService
    }
}
