//
//  ClubRankingResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

typealias ClubRankingResponseDTO = BaseResponseDTO<[ClubRankingData]>

struct ClubRankingData: Decodable {
    let id: Int
    let clubName: String
    let clubIntroduce: String
    let clubImage: String
}

