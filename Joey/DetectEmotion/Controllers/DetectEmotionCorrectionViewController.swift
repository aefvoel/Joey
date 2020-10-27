//
//  DetectEmotionCorrectionViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 27/10/20.
//

import UIKit

class DetectEmotionCorrectionViewController: UIViewController {

    var data: FollowUp?
    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    
    @IBAction func onAnswerButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            data?.correctEmotion = .happy
        case 2:
            data?.correctEmotion = .neutral
        case 3:
            data?.correctEmotion = .angry
        default:
            data?.correctEmotion = .sad
        }
        performSegue(withIdentifier: "toScale", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionScaleViewController {
            vc.data = data
        }
    }

}
