//
//  DetectEmotionScaleViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionReasonViewController: UIViewController {
    
    var data: FollowUp?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard let reason = sender.titleLabel?.text else { return }
        data?.reason = reason
        performSegue(withIdentifier: "toAdvice", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
