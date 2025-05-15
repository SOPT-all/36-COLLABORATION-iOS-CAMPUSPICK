//
//  RegionType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/16/25.
//

enum RegionType: CaseIterable {
    case all
    case capitalRegion
    case chungcheongDaejeon
    case jeonbuk
    case jeonnamGwangju
    case gyeongbukDaegu
    case gyeongnamBusanUlsan
    case gangwon
    case jeju
    case etc
    
    func title() -> String {
        switch self {
        case .all:
            return "전국"
        case .capitalRegion:
            return "수도권"
        case .chungcheongDaejeon:
            return "충북/충남/대전"
        case .jeonbuk:
            return "전북"
        case .jeonnamGwangju:
            return "전남/광주"
        case .gyeongbukDaegu:
            return "경북/대구"
        case .gyeongnamBusanUlsan:
            return "경남/부산/울산"
        case .gangwon:
            return "강원"
        case .jeju:
            return "제주"
        case .etc:
            return "기타"
        }
    }
}
