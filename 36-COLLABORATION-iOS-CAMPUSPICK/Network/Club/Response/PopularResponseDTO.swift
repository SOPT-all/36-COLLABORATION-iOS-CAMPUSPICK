//
//  PopularResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/23/25.
//

import Foundation

typealias PopularClubResponseDTO = BaseResponseDTO<[PopularData]>
typealias PopularActivitiesResponseDTO = BaseResponseDTO<[PopularData]>

struct PopularData: Decodable {
    let id: Int
    let title: String
    let viewCount: Int
    let commentCount: Int
    let image: String
}
