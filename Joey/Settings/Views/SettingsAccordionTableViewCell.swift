//
//  SettingsAccordionTableViewCell.swift
//  Joey
//
//  Created by Rahman Fadhil on 04/11/20.
//

import UIKit

struct AccordionItem {
    let title: String
    let content: String
}

class SettingsAccordionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chevronImage: UIImageView!
    @IBOutlet weak var contentLabel: PaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(data: AccordionItem, isActive: Bool) {
        titleLabel.text = data.title
        contentLabel.text = data.content
        setChevron(isActive)
        backgroundColor = .clear
    }
    
    func setChevron(_ toActive: Bool) {
        if toActive {
            chevronImage.image = UIImage(systemName: "chevron.up")
        } else {
            chevronImage.image = UIImage(systemName: "chevron.down")
        }
    }
}
