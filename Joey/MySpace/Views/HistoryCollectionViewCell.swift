//
//  HistoryCollectionViewCell.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 02/11/20.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var reuseIdentifier: String {
        return "HistoryCell"
    }
    class var nibName: String {
        return "HistoryCollectionViewCell"
    }
    func configureCell(label: String) {
        self.labelDate.text = label
    }

}
