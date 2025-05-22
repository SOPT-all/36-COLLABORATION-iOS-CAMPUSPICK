//
//  ClubModel.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/21/25.
//

import UIKit

struct ClubModel {
    let image: UIImage
    let title: String
    let viewNum: String
    let dDay: String
}

extension ClubModel {
    static func dummy() -> [ClubModel] {
        return [
            ClubModel(image: .imgBest1, title: "⭐️꿈꾸는 과학 38⭐️신입 부원을 상시 모집합니다! ", viewNum: "2,533", dDay: "D-67"),
            ClubModel(image: .imgBest2, title: "혼성 댄스팀 :D.Light에서 신입 멤버 모집합니다!", viewNum: "1,676", dDay: "D-43"),
            ClubModel(image: .imgBest1, title: "야라라라라라랑ㄹㅁㄹㅁㄴㄹ마라라라라라라라", viewNum: "1,234", dDay: "D-??")
        ]
    }
}
