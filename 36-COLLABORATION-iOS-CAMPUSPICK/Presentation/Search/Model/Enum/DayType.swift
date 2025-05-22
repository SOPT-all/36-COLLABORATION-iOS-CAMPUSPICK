//
//  DayType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

enum DayType: String, CaseIterable, FilterOptionType {
    case all
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case weekend
    
    func title() -> String {
        switch self {
        case .all:
            return "전체"
        case .monday:
            return "월"
        case .tuesday:
            return "화"
        case .wednesday:
            return "수"
        case .thursday:
            return "목"
        case .friday:
            return "금"
        case .weekend:
            return "주말"
        }
    }
}

extension DayType {
    var serverValue: String? {
        switch self {
        case .all: return nil
        case .monday: return "MONDAY"
        case .tuesday: return "TUESDAY"
        case .wednesday: return "WEDNESDAY"
        case .thursday: return "THURSDAY"
        case .friday: return "FRIDAY"
        case .weekend: return "WEEKEND"
        }
    }
}
