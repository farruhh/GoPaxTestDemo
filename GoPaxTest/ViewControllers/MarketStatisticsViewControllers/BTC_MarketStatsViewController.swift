//
//  KRWViewController.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/14.
//

import UIKit
import CocoaLumberjack

/// `Market Price Statistics VC (BTC)`
class BTC_MarketStatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var contents: [Entity] = []
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var keyPathParam: String?
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        APIcall()
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.sizeToFit()
            controller.definesPresentationContext = true
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
    //MARK: - refreshData
    /// `Refresh TableView`
    /// - Parameter data: Entity
    func refresh(data: Entity) {
        self.contents.append(data)
        self.tableView.reloadData()
    }
    //MARK: - APIcall
    func APIcall() {
        ServerCommunicator.getPairs().done{ response in
            // self.contents.removeAll()
            let group = DispatchGroup()
            for keyPathParam in response {
                group.enter()
                let pairName = keyPathParam.name
                ServerCommunicator.getTicker(with: pairName).done{ ticker in
                    let entity = Entity(name: nil, baseAsset: keyPathParam.baseAsset, quoteAsset: keyPathParam.baseAsset, price: ticker.price, volume: ticker.volume)
                    self.refresh(data: entity)
                    group.leave()
                }.catch{(err) in
                    print(err)
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                self.tableView.reloadData()
            }
        }.catch{(error) in
            print(error)
        }
    }
}
//MARK: - UITableViewDataSource
extension BTC_MarketStatsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultSearchController.isActive {
            return self.filteredTableData.count
        } else {
            return self.contents.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "BTC_MarketStatsCell") as! BTC_MarketStatsCell
        let entity = self.contents[indexPath.row]
        cell.configure(data: entity)
        
        return cell
    }
}
//MARK: - UITableViewDelegate
extension BTC_MarketStatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK: - UISearchResultsUpdating
extension BTC_MarketStatsViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (filteredTableData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
