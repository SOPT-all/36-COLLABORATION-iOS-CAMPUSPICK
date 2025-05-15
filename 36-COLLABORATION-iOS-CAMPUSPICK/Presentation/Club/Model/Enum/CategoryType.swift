//
//  CategoryType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/14/25.
//

enum CategoryType: CaseIterable {
    case all
    case art
    case volunteer
    case study
    case foreignLanguage
    case sports
    case friends
    case other
    
    func title() -> String {
        switch self {
        case .all:
            return "전체"
        case .art:
            return "문화/예술/공연"
        case .volunteer:
            return "봉사/사회활동"
        case .study:
            return "학술/교양"
        case .foreignLanguage:
            return "어학"
        case .sports:
            return "체육"
        case .friends:
            return "친목"
        case .other:
            return "기타"
        }
    }
}
