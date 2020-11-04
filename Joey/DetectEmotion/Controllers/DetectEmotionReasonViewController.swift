//
//  DetectEmotionScaleViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionReasonViewController: UIViewController {
    
    @IBOutlet weak var navBar: NavigationBar!
    var data: FollowUp?

    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        navBar.labelIndicator.isHidden = false
        if let isDetectionValid = data?.isDetectionResultValid, isDetectionValid {
            navBar.labelIndicator.text = "2/4"
        } else {
            navBar.labelIndicator.text = "3/5"
        }
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard let reason = sender.titleLabel?.text else { return }
        data?.reason = reason
        performSegue(withIdentifier: "toAdvice", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionAdviceViewController {
            vc.data = data
        }
    }

}
