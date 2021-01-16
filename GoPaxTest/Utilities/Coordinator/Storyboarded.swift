//
//  Storyboarded.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/14.
//

import Foundation
import UIKit

/// `Coordinator Pattern Protocol : initates the VC through the storyboard and return the VC `
/// `Make sure all  VC that are being initiated confirms to this Protocol in order to be in effect.`
protocol StoryBoarded {
    static func instantiate() -> Self
}
extension StoryBoarded where Self: UIViewController {
    static func instantiate() ->  Self {
        let id = String (describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if #available(iOS 13.0, *) {
            return storyboard.instantiateViewController(identifier: id) as! Self
        } else {
            // Fallback on earlier versions
        }
        return instantiate()
    }
}
