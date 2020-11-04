//
//  DetectEmotionSuggestActivityViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 27/10/20.
//

import UIKit

class DetectEmotionSuggestActivityViewController: UIViewController {

    var data: FollowUp?
    var instruction: ActivitiesInstruction?
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        navBar.labelIndicator.isHidden = false
        if let isDetectionValid = data?.isDetectionResultValid, isDetectionValid {
            navBar.labelIndicator.text = "4/4"
        } else {
            navBar.labelIndicator.text = "5/5"
        }
        if let activity = data?.suggestActivity() {
            instruction = activity
            suggestionLabel.text = "This is the activity that you can do to calm yourself, \(activity.title).\nDo you want to start now?"
        }
    }
    
    func popTo<T>(_ vc: T.Type) {
       let targetVC = navigationController?.viewControllers.first{$0 is T}
       if let targetVC = targetVC {
          navigationController?.popToViewController(targetVC, animated: true)
       }
    }

    @IBAction func onStartButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toInstruction", sender: nil)
    }
    
    @IBAction func onNoButtonTapped(_ sender: Any) {
        popTo(HomeViewController.self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InstructionViewController {
            vc.activityInstruction = instruction
        }
    }

}
