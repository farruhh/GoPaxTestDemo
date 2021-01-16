//
//  SubCoordinator.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/14.
//

import Foundation
import UIKit

///`Coordinator Pattern delegate`
protocol SubCoordinator {
    var subCoordinators: [SubCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
