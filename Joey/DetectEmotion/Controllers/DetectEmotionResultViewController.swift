//
//  DetectEmotionResultViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 20/10/20.
//

import UIKit

class DetectEmotionResultViewController: UIViewController {
    
    var faceImage: UIImage?
    var emotion: String?
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewContainer.layer.cornerRadius = 14
        imageResult.layer.cornerRadius = 14
        imageResult.image = faceImage
        labelResult.text = emotion
        buttonContinue.layer.cornerRadius = 14
    }
    
    @IBAction func buttonContinueTapped(_ sender: Any) {
        if let emotion = emotion {
            EmotionHelper.save(emotion: emotion) { (error) in
                let alert = AlertHelper.createAlert(title: "Failed to save emotion to your phone!", message: "If you want to save your emotion to your space, please scan your face again.") {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                DispatchQueue.main.async {
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
