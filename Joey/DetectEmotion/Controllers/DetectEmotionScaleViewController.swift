//
//  DetectEmotionScaleViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionScaleViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var navBar: NavigationBar!
    var data: FollowUp?
    @IBOutlet weak var scaleSlider: CustomSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        navBar.labelIndicator.isHidden = false
        if let isDetectionValid = data?.isDetectionResultValid, isDetectionValid {
            navBar.labelIndicator.text = "1/4"
        } else {
            navBar.labelIndicator.text = "2/5"
        }
        
        questionLabel.text = data?.emotion.scaleQuestion
    }
    
    @IBAction func onOkayButtonTapped(_ sender: Any) {
        data?.scale = scaleSlider.value
        performSegue(withIdentifier: "toReason", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionReasonViewController {
            vc.data = data
        }
    }

}
