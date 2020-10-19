//
//  Activity.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 19/10/20.
//

import UIKit

struct Activity {
    var label: String
    var image: UIImage
    
    init(label: String, image: UIImage) {
        self.label = label
        self.image = image
    }
}

var activityList = [
    Activity(label: "Thoughts record", image: UIImage(named: "queensperil.jpg")!),
    Activity(label: "Express your emotion", image: UIImage(named: "queensperil.jpg")!),
    Activity(label: "Breathing", image: UIImage(named: "queensperil.jpg")!),
    Activity(label: "Smile", image: UIImage(named: "queensperil.jpg")!)
]
