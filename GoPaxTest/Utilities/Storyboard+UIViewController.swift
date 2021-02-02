//
//  Storyboard+UIViewController.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/08.
//
import Foundation
import UIKit
import KWDrawerController

///`Storyboard + VC initiator`
extension UIStoryboard {
    fileprivate class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    @available(iOS 13.0, *)
    class func mainNavigation() -> UINavigationController {
        return mainStoryBoard().instantiateViewController(identifier: "MainNavigationView") as! UINavigationController
    }
    @available(iOS 13.0, *)
    class func splashViewController() -> SplashViewController {
        return mainStoryBoard().instantiateViewController(identifier: "SplashViewController") as! SplashViewController
    }
    class func assetsStatisticsViewController() -> AssetStatisticsViewController {
        return mainStoryBoard().instantiateViewController(identifier: "AssetStatisticsViewController") as! AssetStatisticsViewController
    }
    /*
    class func tradingPairsVC() -> MainViewController {
        return mainStoryBoard().instantiateViewController(identifier: "TradingPairsViewController") as! MainViewController
    }
 */
}

