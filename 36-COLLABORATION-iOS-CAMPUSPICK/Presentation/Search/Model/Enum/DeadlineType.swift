//
//  DeadlineType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

enum DeadlineType: CaseIterable {
    case all
    case under7
    case over7
    case over14
    case over30
    
    func title() -> String {
        switch self {
        case .all:
            return "전체"
        case .under7:
            return "7일 이하"
        case .over7:
            return "7일 이상"
        case .over14:
            return "14일 이상"
        case .over30:
            return "30일 이상"
        }
    }
}
