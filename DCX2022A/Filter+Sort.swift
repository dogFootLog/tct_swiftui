//
//  Filter+Sort.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/21.
//

import Foundation

enum Category: String, Codable, Hashable {
    case ck = "CK"
    case pz = "PZ"
    case sf = "SF"
    case cf = "CF"
}

public enum SortOption: String, Codable, Hashable {
    case id = "id"
    case point = "point"
    case review = "review"
}
