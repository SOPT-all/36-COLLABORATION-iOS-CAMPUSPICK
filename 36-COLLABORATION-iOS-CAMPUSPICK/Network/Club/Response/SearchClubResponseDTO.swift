//
//  SearchClubResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 김나연 on 5/21/25.
//

import Foundation

typealias SearchClubResponseDTO = BaseResponseDTO<[SearchData]>

struct SearchData: Decodable {
    let clubInfo: ClubInfo
    let recruitPost: RecruitPost
}

struct ClubInfo: Decodable {
    let id: Int
    let name: String
    let image: String
    let category: String
    let region: String
    let clubDay: String
}

struct RecruitPost: Decodable {
    let id: Int
    let title: String
    let image: String
    let viewCount: Int
    let commentCount: Int
    let dDay: Int
}
