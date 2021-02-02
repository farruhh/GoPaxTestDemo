//
//  TableViewHeaderCustom.swift
//  GoPaxTest
//
//  Created by frank on 2021/02/01.
//

import UIKit

class TableViewHeaderCustom: UITableViewHeaderFooterView {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    static let identifier = "TableViewHeaderCustom"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subContentView.layer.cornerRadius = 30
        self.subContentView.backgroundColor = .black
        self.segmentControl.layer.masksToBounds = true
        self.subContentView.layer.masksToBounds = true
        self.subContentView.layer.maskedCorners = [.layerMaxXMinYCorner]
        self.segmentControl.selectedSegmentTintColor = .clear
        self.segmentControl.backgroundColor = .clear
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0), NSAttributedString.Key.foregroundColor: UIColor.green], for: .normal)
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25.0), NSAttributedString.Key.foregroundColor: UIColor.green], for: .selected)
    }
}
