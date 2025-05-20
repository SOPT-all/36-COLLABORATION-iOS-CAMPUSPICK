//
//  ErrorResponseDTO.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by OneTen on 5/20/25.
//

import Foundation

struct ErrorResponseDTO: Decodable {
  let status: Int
  let message: String
}
