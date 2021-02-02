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
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
