//
//  NetworkService.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() { }
    
    let clubService: ClubServiceProtocol = ClubService()
    let homeService: HomeServiceProtocol = HomeService()
}
