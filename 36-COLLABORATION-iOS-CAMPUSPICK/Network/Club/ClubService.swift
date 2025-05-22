//
//  ClubService.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

protocol ClubServiceProtocol {
    func getClubRanking() async -> Result<ClubRankingResponseDTO, NetworkError>
    func searchClubs(title: String?, category: String?, deadlineType: String?, region: String?, clubDay: String?) async -> Result<SearchClubResponseDTO, NetworkError>
}

final class ClubService: BaseService, ClubServiceProtocol {
    
    func getClubRanking() async -> Result<ClubRankingResponseDTO, NetworkError> {
        return await requestDecodable(target: ClubAPI.getClubRanking)
    }
    
    func searchClubs(title: String?, category: String?, deadlineType: String?, region: String?, clubDay: String?) async -> Result<SearchClubResponseDTO, NetworkError> {
        return await requestDecodable(target: ClubAPI.searchClubs(title: title, category: category, deadlineType: deadlineType, region: region, clubDay: clubDay))
    }
}

