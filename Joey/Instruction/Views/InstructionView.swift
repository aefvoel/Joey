//
//  InstructionView.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class InstructionView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelInstruction: UILabel!
    
    @IBOutlet weak var benefitLabel1: UILabel!
    @IBOutlet weak var benefitLabel2: UILabel!
    @IBOutlet weak var benefitLabel3: UILabel!
    
    func setupData(data: ActivitiesInstruction) {
        labelTitle.text = data.title
        labelInstruction.text = data.instructionContent
        backgroundImage.image = data.activityInstructionImage
        benefitLabel1.text = data.whyItWorks[0]
        benefitLabel2.text = data.whyItWorks[1]
        benefitLabel3.text = data.whyItWorks[2]
    }

}
