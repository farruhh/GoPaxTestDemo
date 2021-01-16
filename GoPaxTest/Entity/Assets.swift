//
//  Assets.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/19.
//

import Foundation
/// `Asset`
struct Assets {
    var id, name: String
}
extension Assets: Decodable {
    enum TrackingCodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let trackContainer = try decoder.container(keyedBy: TrackingCodingKeys.self)
        if trackContainer.contains(.id){
            id = try trackContainer.decode(String.self, forKey: .id)
        }else{
            id = "id"
        }
        if trackContainer.contains(.name) {
            name =  try trackContainer.decode(String.self, forKey: .name)
        }
        else {
            name = "name"
        }
    }
}
