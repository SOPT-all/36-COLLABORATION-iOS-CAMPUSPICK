//
//  PopularActivitiesResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/23/25.
//

import Foundation

typealias PopularActivitiesResponseDTO = BaseResponseDTO<[PopularActivitiesData]>

struct PopularActivitiesData: Decodable {
    let id: Int
    let title: String
    let viewCount: String
    let commentCount: String
    let image: String
}
