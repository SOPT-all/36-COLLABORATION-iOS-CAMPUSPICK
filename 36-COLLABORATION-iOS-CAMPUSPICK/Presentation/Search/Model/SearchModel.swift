//
//  SearchModel.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/14/25.
//

import UIKit

struct SearchModel {
    let category: String
    let region: String
    let clubProfileImage: UIImage
    let clubName: String
    let title: String
    let image: UIImage
    let viewCount: Int
    let commentCount: Int
    let dDay: Int
}

extension SearchModel {
    static func dummy() -> [SearchModel] {
        return [
            SearchModel(category: CategoryType.art.title(), region: RegionType.capitalRegion.title(), clubProfileImage: .imgProfile11, clubName: "여우별", title: "밴드 여우별 신규 멤버 모집!", image: .imgClub1, viewCount: 428, commentCount: 1, dDay: 47),
            SearchModel(category: CategoryType.art.title(), region: RegionType.capitalRegion.title(), clubProfileImage: .imgProfile11, clubName: "여우별", title: "밴드 여우별 신규 멤버 모집!", image: .imgClub1, viewCount: 428, commentCount: 1, dDay: 47),
            SearchModel(category: CategoryType.art.title(), region: RegionType.capitalRegion.title(), clubProfileImage: .imgProfile11, clubName: "여우별", title: "밴드 여우별 신규 멤버 모집!", image: .imgClub1, viewCount: 428, commentCount: 1, dDay: 47),
            SearchModel(category: CategoryType.art.title(), region: RegionType.capitalRegion.title(), clubProfileImage: .imgProfile11, clubName: "여우별", title: "밴드 여우별 신규 멤버 모집!", image: .imgClub1, viewCount: 428, commentCount: 1, dDay: 47),
            SearchModel(category: CategoryType.art.title(), region: RegionType.capitalRegion.title(), clubProfileImage: .imgProfile11, clubName: "여우별", title: "밴드 여우별 신규 멤버 모집!", image: .imgClub1, viewCount: 428, commentCount: 1, dDay: 47)
        ]
    }
}
