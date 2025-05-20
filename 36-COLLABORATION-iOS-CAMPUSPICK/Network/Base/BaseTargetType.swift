//
//  BaseTargetType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

enum HeaderType {
    case noneHeader
    case accessTokenHeader
}

protocol BaseTargetType {
    var headerType: HeaderType { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var body: Encodable? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension BaseTargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨Base URL을 찾을 수 없습니다🚨")
        }
        return url
    }
    
    var headers: [String: String]? {
        var headers: [String: String] = [
            "Content-Type": "application/json"
        ]
        
        switch headerType {
        case .noneHeader:
            return headers
        case .accessTokenHeader:
            return nil //이번 API들 중 토큰 필요한 게 없음
        }
    }
    
    var body: Encodable? {
        return nil
    }

    var url: URL {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        return components?.url ?? baseURL.appendingPathComponent(path)
    }
    
}
