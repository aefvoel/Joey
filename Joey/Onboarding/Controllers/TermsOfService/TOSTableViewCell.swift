//
//  TOSTableViewCell.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import UIKit

class TOSTableViewCell: UITableViewCell {

    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelAnswer: UILabel!
    
    @IBOutlet weak var chevronImage: UIImageView!
    
    var tosItem: TermsOfServiceModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(tosData: TermsOfServiceModel) {
        tosItem = tosData
        labelQuestion.text = tosItem.tosQuestion
        labelAnswer.text = tosItem.tosAnswer
    }
    
    func setChevron(_ toActive: Bool) {
        if toActive {
            chevronImage.image = UIImage(systemName: "chevron.up")
        } else {
            chevronImage.image = UIImage(systemName: "chevron.down")
        }
    }

}
