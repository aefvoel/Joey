//
//  RecordCollectionViewCell.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 03/11/20.
//

import UIKit

class RecordCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelRecord: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var reuseIdentifier: String {
        return "RecordCollectionView"
    }
    class var nibName: String {
        return "RecordCollectionViewCell"
    }
    func configureCell(label: String) {
        self.labelRecord.text = label
    }

}
