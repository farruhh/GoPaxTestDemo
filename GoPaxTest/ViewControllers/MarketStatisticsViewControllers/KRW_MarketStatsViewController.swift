//
//  KRWViewController.swift
//  GoPaxTest
//
//  Created by frank on 2020/10/14.
//

import UIKit
import CocoaLumberjack
/// `Market Price Statistics VC (KRW)`
class KRW_MarketStatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var contents: [Entity]?
    var keyPathParam: String?
    var filteredTableData: [String] = []
    var resultSearchController = UISearchController()
    var mockData: [MockData] = [MockData(name: "Ethereum", price: 234234.43464, volume: 6543.564345)]
    //MARK:- viewDidLoad()
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
    //MARK: - refresh
    /// `Refresh Tableview`
    /// - Parameter data: Entity
    func refresh(data: [Entity]) {
        self.contents = data
        self.tableView.reloadData()
    }
    //
    //    func ascendingSortByPrice() {
    //        self.contents.sorted(by: { $0.price > $1.price })
    //    }
    //
    //    func descendingSortByPrice(){
    //        self.contents.sorted(by: { $0.price < $1.price })
    //    }
    //MARK: - APIcall
    func APIcall() {
        ServerCommunicator.getPairs().done{ response in
            //self.contents.removeAll()
            let group = DispatchGroup()
            for keyPathParam in response {
                group.enter()
                let pairName = keyPathParam.name
                ServerCommunicator.getTicker(with: pairName).done{ ticker in
                    let entity = Entity(name: nil, baseAsset: keyPathParam.baseAsset, quoteAsset: keyPathParam.quoteAsset, price: ticker.price, volume: ticker.volume)
                    self.refresh(data: [entity])
                }.catch{(err) in
                    print(err)
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                self.tableView.reloadData()
            }
        }.catch{(err) in
            print(err)
        }
    }
    func getAssets() {
        ServerCommunicator.getAssets().done{ response in
            for assets in response {
                print(assets)
            }
            print(response)
        }.catch{(err) in
            print(err)
        }
    }
}
//MARK: - UITableViewDataSource
extension KRW_MarketStatsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.contents else {
            DDLogError("data is nil")
            return 0
        }
        if data.count == 0 {
            return self.mockData.count
        } else {
            return data.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "KRW_MarketStatsCell") as! KRW_MarketStatsCell
        guard let data = self.contents else {
            DDLogError("data is nil")
            return cell
        }
        if data.count == 0 {
            let mockData = self.mockData[indexPath.row]
            cell.configure(mockData: mockData)
        } else {
            let entity = data[indexPath.row]
            cell.configure(data: entity)
        }
        return cell
    }
}
//MARK: - UITableViewDelegate
extension KRW_MarketStatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK: - UISearchResultsUpdating
extension KRW_MarketStatsViewController : UISearchResultsUpdating {
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
