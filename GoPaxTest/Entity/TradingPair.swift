//
//  TradingPair.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/17.
//
import Foundation

/// `Pairs`
struct TradingPair {
    var id: Int
    var name: String
    var quoteAsset: String
    var baseAsset: String
}
extension TradingPair: Decodable {
    enum TrackCodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case quoteAsset = "quoteAsset"
        case baseAsset = "baseAsset"
    }
    init(from decoder: Decoder) throws {
        let trackContainer = try decoder.container(keyedBy: TrackCodingKeys.self)
        if trackContainer.contains(.id){
            id = try trackContainer.decode(Int.self, forKey: .id)
        }else{
            id = Int()
        }
        if trackContainer.contains(.name) {
            name = try trackContainer.decode(String.self, forKey: .name)
        } else {
            name = "name"
        }
        if trackContainer.contains(.quoteAsset) {
            quoteAsset = try trackContainer.decode(String.self, forKey: .quoteAsset)
        } else {
            quoteAsset = "quoteAsset"
        }
        if trackContainer.contains(.baseAsset) {
            baseAsset = try trackContainer.decode(String.self, forKey: .baseAsset)
        } else {
            baseAsset = "baseAsset"
        }
    }
}

