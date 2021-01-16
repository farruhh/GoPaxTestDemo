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
}
