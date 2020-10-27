//
//  DetectEmotionValidateViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionValidateViewController: UIViewController {
    
    @IBOutlet weak var navBar: NavigationBar!
    var data: FollowUp?
    var emotion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    
    @IBAction func validResultTapped(_ sender: UIButton) {
        data?.isDetectionResultValid = true
        performSegue(withIdentifier: "toScale", sender: nil)
    }
    
    @IBAction func invalidResultTapped(_ sender: Any) {
        data?.isDetectionResultValid = true
        performSegue(withIdentifier: "toWrongResult", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionScaleViewController {
            vc.data = data
        } else if let vc = segue.destination as? DetectEmotionAnalyzeAgainViewController {
            vc.data = data
        }
    }

}
