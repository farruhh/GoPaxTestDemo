//
//  SplashViewController.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/08.
//

import UIKit
import Lottie
import CocoaLumberjack

class SplashViewController: UIViewController {
    private var dispatchItem: DispatchWorkItem?
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        dispatchItem = DispatchWorkItem { [weak self] in
//            self?.smth()
//            self?.dispatchItem = nil
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: dispatchItem!)
    }
//    deinit {
//        self.dispatchItem?.cancel()
//    }
//    func smth() {
//        print("hi-------------------!!!")
//        UIApplication.app().coordinator?.start()
//    }
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        let animationView = AnimationView()
        let animation = Animation.named("34722-money-2-white", bundle: Bundle.main)
        animationView.animation = animation
        animationView.frame = CGRect(origin: .zero, size: CGSize(width: self.view.frame.size.width, height: 200))
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() +  0.5, execute: {
                let vc  = self.storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
        view.addSubview(animationView)
    }
    //MARK: - didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}