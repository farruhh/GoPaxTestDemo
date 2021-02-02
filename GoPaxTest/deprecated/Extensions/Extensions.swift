//
//  Extensions.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/19.
//

import Foundation
import UIKit

extension Double {
    /// `Takes the given Int value and rounds the decimal points where Int value determines the decimal point.`
    /// - Parameter point: Int:  determines the decimal point
    /// - Returns: returns the decimal value with the specied rounded point
    func rounded(decimal point: Int) -> Double {
        let divisor = pow(10.0, Double(point))
        return (self * divisor).rounded() / divisor
    }
}
