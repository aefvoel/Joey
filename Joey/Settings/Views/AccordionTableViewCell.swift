//
//  AccordionTableViewCell.swift
//  Joey
//
//  Created by Rahman Fadhil on 03/11/20.
//

import UIKit

class AccordionTableViewCell: UITableViewCell {

    @IBOutlet weak var chevronImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(title: String, content: String, isActive: Bool) {
        titleLabel.text = title
        contentLabel.text = content
        selectionStyle = .none
        if isActive {
            chevronImage.image = UIImage(systemName: "chevron.up")
        } else {
            chevronImage.image = UIImage(systemName: "chevron.down")
        }
    }
}
