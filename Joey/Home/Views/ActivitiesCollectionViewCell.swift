//
//  ActivitiesCollectionViewCell.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 19/10/20.
//

import UIKit

class ActivitiesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageActivities: UIImageView!
    @IBOutlet weak var labelActivities: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var reuseIdentifier: String {
        return "HomeActivities"
    }
    class var nibName: String {
        return "ActivitiesCollectionViewCell"
    }
    func configureCell(label: String, image: UIImage) {
        self.labelActivities.text = label
        self.imageActivities.image = image
    }
}

