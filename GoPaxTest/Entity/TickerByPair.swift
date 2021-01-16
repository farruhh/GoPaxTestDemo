//
//  TickerByPair.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/17.
//

import Foundation

/// `Ticker`
struct TickerByPair {
    var price, ask: Double
    var askVolume: Double
    var bid: Double
    var bidVolume, volume: Double
    var time: String
}
extension TickerByPair: Decodable{
    enum TrackCodingKeys: String, CodingKey {
        case price = "price"
        case ask = "ask"
        case askVolume = "askVolume"
        case bid = "bid"
        case bidVolume = "bidVolume"
        case volume = "volume"
        case time = "time"
    }
    init(from decoder: Decoder) throws {
        let trackContainer = try decoder.container(keyedBy: TrackCodingKeys.self)
        if trackContainer.contains(.price){
            price = try trackContainer.decode(Double.self, forKey: .price)
        }else{
            price = Double()
        }
        if trackContainer.contains(.ask) {
            ask = try trackContainer.decode(Double.self, forKey: .ask)
        } else {
            ask = Double()
        }
        if trackContainer.contains(.askVolume) {
            askVolume = try trackContainer.decode(Double.self, forKey: .askVolume)
        } else {
            askVolume = Double()
        }
        if trackContainer.contains(.bid) {
            bid = try trackContainer.decode(Double.self, forKey: .bid)
        } else {
            bid = Double()
        }
        if trackContainer.contains(.bidVolume) {
            bidVolume = try trackContainer.decode(Double.self, forKey: .bidVolume)
        } else {
            bidVolume = Double()
        }
        if trackContainer.contains(.volume) {
            volume = try trackContainer.decode(Double.self, forKey: .volume)
        } else {
            volume = Double()
        }
        if trackContainer.contains(.time) {
            time = try trackContainer.decode(String.self, forKey: .time)
        }
        else {
            time = "time"
        }
    }
}

