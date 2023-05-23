//
//  ViewModel.swift
//  DCX2022A
//
//  Created by 강수희 on 2023/05/22.
//

import Foundation
import Combine
import SwiftyJSON
import Alamofire

final class ViewModel: ObservableObject {
    @Published var shopList: [DataModel1] = []
    @Published var shopDetail: DataModel2?
    @Published var filter: Category? = nil
    @Published var selectedFilter: Category? = nil
    
    
    @Published var sortOption: SortOption = .id {
        willSet(newOption) {
            switch newOption {
                case .id:
                    shopList.sort(by: {$0.id < $1.id})
                case .point:
                    shopList.sort(by: {$0.point > $1.point})
                case .review:
                    shopList.sort(by: {$0.review > $1.review})
            }
        }
    }
    
    public init() {
        loadShopList("http://localhost:3300/dcx/1/shopList")
    }
    
    func loadShopList(_ urlString: String, param: [String: Any] = [:]) {
        let url = URL(string: urlString)!
        AF.request(url,
                   method: .get)
        .validate(statusCode: 200..<500)
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                if response.response?.statusCode == 200 {
                    let json = JSON(value)
                    do {
                        let decoder = JSONDecoder()
                        self.shopList = try decoder.decode([DataModel1].self, from: (json["shopList"].rawData()))
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadShopDetail(_ urlString: String, param: [String: Any] = [:]) {
        let url = URL(string: urlString)!
        AF.request(url,
                   method: .get)
        .validate(statusCode: 200..<500)
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                if response.response?.statusCode == 200 {
                    let json = JSON(value)
                    do {
                        let decoder = JSONDecoder()
                        self.shopDetail = try decoder.decode(DataModel2.self, from: (json["shop"].rawData()))
                    } catch {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
