//
//  DetectEmotionStartViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 14/10/20.
//

import UIKit
import ARKit
import AVFoundation

class DetectEmotionStartViewController: UIViewController {

    @IBOutlet weak var buttonStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonStartTapped(_ sender: Any) {
        guard ARFaceTrackingConfiguration.isSupported else {
            let alert = AlertHelper.createAlert(title: "Your device doesn't support face tracking", message: "We can't proceed unless you have an iPhone X or newer") {
                self.navigationController?.popViewController(animated: true)
            }
            present(alert, animated: true)
            return
        }

        AVCaptureDevice.requestAccess(for: .video) { (granted) in
            if granted {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toDetectEmotion", sender: nil)
                }
            } else {
                DispatchQueue.main.async {
                    let alert = AlertHelper.createAlert(title: "You don't give us access to your camera", message: "Please turn on camera access to our app in your phone settings") {
                        self.navigationController?.popViewController(animated: true)
                    }
                    self.present(alert, animated: true)
                }
            }
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
