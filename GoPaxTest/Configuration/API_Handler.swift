//
//  API_Handler.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/07.
//

import Foundation

/// `Server-EndPoint requests handler class`
class GoPaxAPI {
/// `Server-EndPoint`
    // Company API URL has been removed.. . 
    private static let serverEndPoint: String = ""
    ///`asset path`
    static var assets: String {
        return serverEndPoint + "/assets"
    }
    ///`pairs path`
    static  var tradingPairs: String {
        return serverEndPoint + "/trading-pairs"
    }
    ///`ticker path`
    static func getPairByTicker(pairName: String) -> String {
        return tradingPairs + "/\(pairName)" + "/ticker"
    }
    
}
