//
//  HomeService.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/23/25.
//

import Foundation

// MARK: - Protocol

protocol HomeServiceProtocol {
    func getPopularClubs() async -> Result<PopularClubResponseDTO, NetworkError>
    func getPopularActivities() async -> Result<PopularActivitiesResponseDTO, NetworkError>
}

// MARK: - Service Implementation

final class HomeService: BaseService, HomeServiceProtocol {
    func getPopularClubs() async -> Result<PopularClubResponseDTO, NetworkError> {
        return await requestDecodable(target: HomeAPI.popularClub)
    }
    func getPopularActivities() async -> Result<PopularActivitiesResponseDTO, NetworkError> {
        return await requestDecodable(target: HomeAPI.popularActivities)
    }
}
