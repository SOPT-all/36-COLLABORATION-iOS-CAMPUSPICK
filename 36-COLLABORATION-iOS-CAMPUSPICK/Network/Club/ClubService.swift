//
//  ClubService.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

protocol ClubServiceProtocol {
    func getClubRanking() async -> Result<ClubRankingResponseDTO, NetworkError>
}

final class ClubService: BaseService, ClubServiceProtocol {
    
    func getClubRanking() async -> Result<ClubRankingResponseDTO, NetworkError> {
        return await requestDecodable(target: ClubAPI.getClubRanking)
    }
    
}

