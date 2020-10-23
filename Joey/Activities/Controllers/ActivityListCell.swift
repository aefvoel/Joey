//
//  ActivityListCell.swift
//  Joey
//
//  Created by Setiawan Joddy on 22/10/20.
//

import UIKit

class ActivityListCell: UITableViewCell {
    
    @IBOutlet weak var imageViewActivity: UIImageView!
    @IBOutlet weak var labelActivityTitle: UILabel!
    @IBOutlet weak var labelActivityShortDesc: UILabel!
    
    func setActivity(activity: ActivitiesInstruction) {
        imageViewActivity.image = activity.activityImage
        labelActivityTitle.text = activity.title
        labelActivityShortDesc.text = activity.activityShortDesc
    }
    
}
