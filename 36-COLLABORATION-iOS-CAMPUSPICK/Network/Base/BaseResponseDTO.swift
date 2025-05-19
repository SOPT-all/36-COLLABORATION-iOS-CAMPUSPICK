//
//  BaseResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let code: String
    let message: String
    let data: T?
}
