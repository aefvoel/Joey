//
//  ActivityListCell.swift
//  Joey
//
//  Created by Setiawan Joddy on 22/10/20.
//

import UIKit

class ActivityListCell: UITableViewCell {
    
    @IBOutlet weak var imageViewActivity: UIImageView!
    @IBOutlet weak var labelActivityName: UILabel!
    @IBOutlet weak var labelActivityShortDesc: UILabel!
    
    func setActivity(activity: ActivityListModel) {
        imageViewActivity.image = activity.activityImage
        labelActivityName.text = activity.activityName
        labelActivityShortDesc.text = activity.activityShortDesc
    }
    
}
