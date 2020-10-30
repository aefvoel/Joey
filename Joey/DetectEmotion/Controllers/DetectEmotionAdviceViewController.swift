//
//  DetectEmotionAdviceViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionAdviceViewController: UIViewController {

    var data: FollowUp?
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTapped))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        backgroundImage.addGestureRecognizer(singleTap)
        backgroundImage.isUserInteractionEnabled = true
    }
    
    func saveEmotion() {
        if let data = data {
            EmotionHelper.save(data: data) {_ in
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toSuggestActivity", sender: nil)
                }
            }
        }
    }
    
    @objc func onBackgroundTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            saveEmotion()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionSuggestActivityViewController {
            vc.data = data
        }
    }

}
