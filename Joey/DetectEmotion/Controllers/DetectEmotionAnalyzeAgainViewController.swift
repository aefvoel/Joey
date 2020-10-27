//
//  DetectEmotionAnalyzeAgainViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 27/10/20.
//

import UIKit

class DetectEmotionAnalyzeAgainViewController: UIViewController {

    var data: FollowUp?
    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    
    func popTo<T>(_ vc: T.Type) {
       let targetVC = navigationController?.viewControllers.first{$0 is T}
       if let targetVC = targetVC {
          navigationController?.popToViewController(targetVC, animated: true)
       }
    }

    @IBAction func onYesButtonTapped(_ sender: Any) {
        popTo(DetectEmotionAnalyzeViewController.self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionCorrectionViewController {
            vc.data = data
        }
    }

}
