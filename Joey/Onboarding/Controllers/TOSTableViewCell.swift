//
//  TOSTableViewCell.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import UIKit

class TOSTableViewCell: UITableViewCell {

    @IBOutlet weak var upperCell: UIView!
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var lowerCell: UIView!
    @IBOutlet weak var labelAnswer: UILabel!
    
    var tosItem: TermsOfServiceModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.upperCell.layer.cornerRadius = 7.0
        
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

}
