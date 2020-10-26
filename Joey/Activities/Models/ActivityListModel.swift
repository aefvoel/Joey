//
//  ActivityListModel.swift
//  Joey
//
//  Created by Setiawan Joddy on 22/10/20.
//

import Foundation
import UIKit

class ActivityListModel {
    var activityImage: UIImage
    var activityName: String
    var activityShortDesc: String
    
    init(activityImage: UIImage, activityName: String, activityShortDesc: String) {
        self.activityImage = activityImage
        self.activityName = activityName
        self.activityShortDesc = activityShortDesc
    }
}

