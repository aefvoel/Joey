//
//  PrivPolicyTableViewCell.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import UIKit

class PrivPolicyTableViewCell: UITableViewCell {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var labelPPQuestion: UILabel!
    
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var labelPPAnswer: UILabel!
    
    var ppItem: PrivacyPolicyModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPPCell(ppData: PrivacyPolicyModel) {
        ppItem = ppData
        labelPPQuestion.text = ppItem.privPolicyQuestion
        labelPPAnswer.text = ppItem.privPolicyAnswer
    }

}
