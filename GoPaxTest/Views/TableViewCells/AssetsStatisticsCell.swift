//
//  AssetsStatisticsCell.swift
//  GoPaxTest
//
//  Created by frank on 2021/02/02.
//

import UIKit

class AssetsStatisticsCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    static let identifier = "AssetsStatisticsCell"
    var btcAsset: Entity! {
        didSet {
            self.setAssetforBTC()
        }
    }
    var krwAsset: Entity! {
        didSet {
            self.setAssetForKRW()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0))
    }
    func setAssetforBTC() {
        if let btcAsset = self.btcAsset {
            self.nameLabel.text = btcAsset.name
            self.priceLabel.text = String(describing: btcAsset.price)
            self.volumeLabel.text = String(describing: btcAsset.volume)
        }
    }
    func setAssetForKRW() {
        if let krwAsset = self.krwAsset {
            self.nameLabel.text = krwAsset.name
            self.priceLabel.text = String(describing: krwAsset.price)
            self.volumeLabel.text = String(describing: krwAsset.volume)
        }
    }
}
