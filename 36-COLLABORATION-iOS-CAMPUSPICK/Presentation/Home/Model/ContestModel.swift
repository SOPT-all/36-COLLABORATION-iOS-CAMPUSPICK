//
//  ContestModel.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/21/25.
//

import UIKit

struct ContestModel {
    let image: UIImage
    let title: String
    let viewNum: String
    let commentNum: String
}

extension ContestModel {
    static func dummy() -> [ContestModel] {
        return [
            ContestModel(image: .homeImgContest1, title: "[모집] 환경문제 해결을\n위한 청년 모임 지원 사업", viewNum: "167", commentNum: "335"),
            ContestModel(image: .homeImgContest2, title: "[광주 신세계안과]\n제 41회 빛창공모전", viewNum: "123", commentNum: "222"),
            ContestModel(image: .homeImgContest3, title: "제 13회 교보문고\n스토리 대상", viewNum: "99", commentNum: "121"),
            ContestModel(image: .homeImgContest1, title: "김나연한치치열\n화이팅", viewNum: "81", commentNum: "99"),
            ContestModel(image: .homeImgContest2, title: "합세 어렵다용", viewNum: "76", commentNum: "47")
        ]
    }
}
