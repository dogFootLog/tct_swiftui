//
//  DataModel.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/17.
//

import Foundation
import Alamofire
import SwiftyJSON

struct DataModel1: Codable, Identifiable {
    var id: Int
    var category: Category
    var name: String
    var point: Float
    var review: Int
    var adFlag: String
    var imageFile: String
}

struct DataModel2: Codable, Identifiable {
    var id: Int
    var name: String
    var point: Float
    var review: Int
    var imageFile: String
    var distance: String
    var time: String
}
