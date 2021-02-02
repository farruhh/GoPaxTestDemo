//
//  TradingPairsViewController.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/13.
//
/*
import UIKit

class MainViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var containerViewA: UIView!
    @IBOutlet weak var containerViewB: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    weak var coordinator: MainCoordinator?
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Exchange"
        view.backgroundColor = .black
        showActivityIndicatory(uiView: self.view)
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.sizeToFit()
            return controller
        })()
    }
    // MARK: - sort funcions
    func sortByPrice() {
        let priceSort = UITapGestureRecognizer(target: self, action: #selector(self.sortPrice))
        self.priceLabel.isUserInteractionEnabled = true
        priceLabel.addGestureRecognizer(priceSort)
    }
    func sortByVolume() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.sortVolume))
        self.volumeLabel.isUserInteractionEnabled = true
        volumeLabel.addGestureRecognizer(tap)
    }
    // MARK: -  @objc funcs
    @objc func sortPrice(sender:UITapGestureRecognizer) {
        print("sortPrice")
    }
    @objc func sortVolume(sender:UITapGestureRecognizer) {
        print("sortVolume")
    }
    @IBAction func showViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.containerViewA.alpha = 1
            self.containerViewB.alpha = 0
        } else {
            self.containerViewB.alpha = 1
            self.containerViewA.alpha = 0
        }
    }
}
extension MainViewController {
    func showActivityIndicatory(uiView: UIView) {
        let container: UIView = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor.white
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.white
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actInd.style =
            UIActivityIndicatorView.Style.large
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2,
                                y: loadingView.frame.size.height / 2);
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        actInd.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            container.removeFromSuperview()
            actInd.stopAnimating()
        })
    }
}
// MARK: - UISearchResultsUpdating
extension MainViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (filteredTableData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        //?
    }
}
*/
