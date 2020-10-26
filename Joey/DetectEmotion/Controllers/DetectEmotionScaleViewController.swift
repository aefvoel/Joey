//
//  DetectEmotionScaleViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionScaleViewController: UIViewController {

    var data: FollowUp?
    @IBOutlet weak var scaleSlider: CustomSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
