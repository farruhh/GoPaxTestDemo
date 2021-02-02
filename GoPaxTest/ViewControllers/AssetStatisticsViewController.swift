//
//  AssetStatisticsViewController.swift
//  GoPaxTest
//
//  Created by frank on 2021/02/01.
//

import UIKit
///` AssetStatisticsViewController: statistical info is displayed on each selected Asset`
class AssetStatisticsViewController: UITableViewController {
    var segmentIndex = Int()
    let bitcoin = Entity.loadBTC()
    let krw = Entity.loadKRW()
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Monitor Virtual Assets"
        self.tableView.register(TableViewHeaderCustom.nib, forHeaderFooterViewReuseIdentifier: TableViewHeaderCustom.identifier)
    }
    // get headerSegmentControl's selected index and perform "            self.tableView.reloadData()"
    @objc func getSegmentIndex(sender: UISegmentedControl) {
        self.segmentIndex = sender.selectedSegmentIndex
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source and delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentIndex {
        case 0:
            return self.bitcoin.count
        default:
            return self.krw.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssetsStatisticsCell.identifier, for: indexPath) as! AssetsStatisticsCell
        switch self.segmentIndex {
        case 0:
            let btcAsset = self.bitcoin[indexPath.row]
            cell.btcAsset = btcAsset
            return cell
        default:
            let krwAsset = self.krw[indexPath.row]
            cell.krwAsset = krwAsset
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeaderCustom.identifier) as! TableViewHeaderCustom
        header.segmentControl.selectedSegmentIndex = self.segmentIndex
        header.segmentControl.addTarget(self, action: #selector(self.getSegmentIndex(sender:)), for: .valueChanged)
        
        return header
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
}
