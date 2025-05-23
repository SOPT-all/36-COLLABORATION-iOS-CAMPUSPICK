//
//  HomeAPI.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/23/25.
//

import Foundation

enum HomeAPI {
    case popularClub
    case popularActivities
}

extension HomeAPI: BaseTargetType {
    var headerType: HeaderType {
        return .noneHeader
    }
    
    var path: String {
        switch self {
        case .popularClub:
            return "/api/v1/clubs/popular"
        case .popularActivities:
            return "/api/v1/activities/popular"
        }
    }
    
    var method: HTTPMethodType {
        return .get
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
}
