//
//  MainCoordinator.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/14.
//
/*
import Foundation
import UIKit
///`Coordinator Pattern: UINavigationCon Flow manager(Alternative). Efficient when the < prepare for segue> method becomes invonvenient`
class MainCoordinator: SubCoordinator {
    var subCoordinators = [SubCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        print("Loaded.. .")
        UIApplication.app().window?.rootViewController = self.navigationController
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    func gotoNext() {
        let vc = SplashViewController.instantiate()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
}
*/


