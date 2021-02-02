//
//  Entity.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/17.
//

import Foundation
/// `Entity Wrapper class that unifies the multiple Entity type property values under the gloabal shared property names `
struct Entity: Decodable {
    let name: String?
    let price: Double
    let volume: Double
    var baseAsset: String?
    var quoteAsset: String?
    
    init(name: String?, baseAsset: String?, quoteAsset: String?, price: Double, volume: Double) {
        self.baseAsset = baseAsset
        self.quoteAsset = quoteAsset
        self.name = name
        self.price = price
        self.volume = volume
    }
    ///`Load Dummy BTC Assets for cells in BTC Segment`
    static func loadBTC() -> [Entity] {
        var bitcoin: [Entity] = [Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89),Entity(name: "BTC", baseAsset: .none, quoteAsset: .none, price: 999.99, volume: 3245.89)]
        for data in bitcoin {
            bitcoin.append(Entity(name: data.name, baseAsset: data.baseAsset, quoteAsset: data.quoteAsset, price: data.price, volume: data.volume))
        }
        return bitcoin
    }
    ///`Load Dummy KRW Assets for cells in KRW Segment`
    static func loadKRW() -> [Entity] {
        var krw: [Entity] = [Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90),Entity(name: "KRW", baseAsset: .none, quoteAsset: .none, price: 888.88, volume: 8754.90)]
        for data in krw {
            krw.append((Entity(name: data.name, baseAsset: data.baseAsset, quoteAsset: data.quoteAsset, price: data.price, volume: data.volume)))
        }
        return krw
    }
}
