//
//  DetectEmotionAdviceViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionAdviceViewController: UIViewController {

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
    
    @objc func onBackgroundTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "toSuggestActivity", sender: nil)
        }
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
