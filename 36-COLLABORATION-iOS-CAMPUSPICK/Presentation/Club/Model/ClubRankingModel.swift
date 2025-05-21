//
//  ClubRankingModel.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/16/25.
//

struct ClubRankingModel {
    let id: Int
    let clubName: String
    let clubIntroduce: String
    let clubImage: String
}

extension ClubRankingModel {
    static func dummy() -> [ClubRankingModel] {
        return [
            ClubRankingModel(id: 1, clubName: "미팅놈들", clubIntroduce: "MEET, EAT, CONNECT “MEATING PEOPLE”", clubImage: "img_club1"),
            ClubRankingModel(id: 2, clubName: "더미2", clubIntroduce: "더미2 소개", clubImage: "img_club2"),
            ClubRankingModel(id: 3, clubName: "더미3", clubIntroduce: "더미3 소개", clubImage: "img_club3")
        ]
    }
}
