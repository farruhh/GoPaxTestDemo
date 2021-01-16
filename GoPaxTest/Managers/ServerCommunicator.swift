//
//  ServerCommunicator.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/07.
//
import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit
import JSONDecoder_Keypath

/// `Class which contains and manages _EndPoit requests`
class ServerCommunicator {
    
    //    static func getPairs() -> Promise<[TradingPair]> {
    //        let decoder = JSONDecoder()
    //        decoder.keyDecodingStrategy = .useDefaultKeys
    //        return Promise { seal in
    //            AF.request(GoPaxAPI.tradingPairs, method: .get, parameters: .none, headers: .none).responseDecodable(of: [TradingPair].self, decoder: decoder) { response in
    //                switch response.result {
    //                    case .success(let pairs):
    //                        return seal.fulfill(pairs)
    //                    case .failure(let error):
    //                        return seal.reject(error)
    //                }
    //            }
    //        }
    //    }
    /// `fetch pairs`
    /// - Returns: seal.fullfil([TradingPairs]), seal.reject(error)
    static func getPairs() -> Promise<[TradingPair]> {
        let decoder = JSONDecoder()
        //  decoder.keyDecodingStrategy = .useDefaultKeys
        return Promise { seal in
            AF.request(GoPaxAPI.tradingPairs, method: .get, parameters: .none, headers: .none).responseData { response in
                switch response.result {
                case .success(let data):
                    print(data)
                    do {
                        let pairs = try decoder.decode([TradingPair].self, from: data)
                        return seal.fulfill(pairs)
                    } catch DecodingError.typeMismatch {
                        do {
                            let pair = try decoder.decode(TradingPair.self, from: data)
                            return seal.fulfill([pair])
                        } catch {
                            return seal.reject(error)
                        }
                    } catch {
                        return seal.reject(error)
                    }
                case .failure(let error):
                    return seal.reject(error)
                }
            }
        }
    }
    /// `fetch ticker`
    /// - Parameter pairName: type String value which takes the pair name as a keyPath parameter
    /// - Returns: seal.fullfil(TickerByPair), seal.reject(error)
    static func getTicker(with pairName: String?) -> Promise<TickerByPair> {
        let decoder = JSONDecoder()
        // decoder.keyDecodingStrategy = .useDefaultKeys
        return Promise { seal in
            AF.request(GoPaxAPI.getPairByTicker(pairName: pairName!), method: .get, parameters: .none, headers: .none).responseDecodable(of: TickerByPair.self, decoder: decoder) { response in
                print(response.result)
                switch response.result {
                case .success(let ticker):
                    return seal.fulfill(ticker)
                case .failure(let error):
                    return seal.reject(error)
                }
            }
        }
    }
    /// `Fetch Asset`
    /// - Returns: seal.fullfil([Assets]), seal.reject(error)
    static func getAssets() -> Promise<[Assets]> {
        let decoder = JSONDecoder()
        return Promise { seal in
            AF.request(GoPaxAPI.assets, method: .get, parameters: .none, headers: .none).responseDecodable(of: [Assets].self, decoder: decoder) { response in
                print(response.result)
                switch response.result {
                case .success(let assets):
                    return seal.fulfill(assets)
                case .failure(let error):
                    return seal.reject(error)
                }
            }
        }
    }
}
