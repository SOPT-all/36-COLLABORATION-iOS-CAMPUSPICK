//
//  HTTPMethodType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

enum HTTPMethodType {
    case get
    case post
    
    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        }
    }
}
