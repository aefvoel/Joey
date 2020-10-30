//
//  InstructionModalViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 29/10/20.
//

import UIKit

class InstructionModalViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: TextViewFixed!
    
    var data: ActivitiesInstruction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = data?.title
        contentTextView.text = data?.scientificReason
    }
    
    @IBAction func onCloseTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
