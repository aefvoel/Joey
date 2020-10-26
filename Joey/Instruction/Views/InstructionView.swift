//
//  InstructionView.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class InstructionView: UIView {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textInstruction: TextViewFixed!
    
    func setupData(data: ActivitiesInstruction) {
        labelTitle.text = data.title
        textInstruction.text = data.instructionContent
    }

}
