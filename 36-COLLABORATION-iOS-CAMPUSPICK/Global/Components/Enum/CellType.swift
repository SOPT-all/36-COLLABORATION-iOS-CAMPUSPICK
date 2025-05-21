//
//  CellType.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/21/25.
//

import UIKit

enum CellType {
    case big
    case small

    var imageHeight: CGFloat {
        switch self {
        case .big: return 155
        case .small: return 106
        }
    }

    var cellHeight: CGFloat {
        switch self {
        case .big: return 217
        case .small: return 172
        }
    }
}
