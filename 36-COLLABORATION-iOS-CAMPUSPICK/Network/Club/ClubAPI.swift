//
//  ClubAPI.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

enum ClubAPI {
    case getClubRanking
    case searchClubs(title: String?, category: String?, deadlineType: String?, region: String?, clubDay: String?)
}

extension ClubAPI: BaseTargetType {

    var headerType: HeaderType {
        return .noneHeader
    }
    
    var path: String {
        switch self {
        case .getClubRanking:
            return "/api/v1/clubs/rank"
        case .searchClubs:
            return "/api/v1/clubs/search"
        }
    }

    var method: HTTPMethodType {
        switch self {
        case .getClubRanking, .searchClubs:
            return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchClubs(let title, let category, let deadlineType, let region, let clubDay):
            return [
                URLQueryItem(name: "title", value: title),
                URLQueryItem(name: "category", value: category),
                URLQueryItem(name: "deadlineType", value: deadlineType),
                URLQueryItem(name: "region", value: region),
                URLQueryItem(name: "clubDay", value: clubDay)
            ].filter { $0.value != nil && !$0.value!.isEmpty }
        case .getClubRanking:
            return nil
        }
    }
}
