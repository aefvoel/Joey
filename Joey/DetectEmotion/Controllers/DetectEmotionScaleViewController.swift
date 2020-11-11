//
//  DetectEmotionScaleViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import UIKit

class DetectEmotionScaleViewController: UIViewController {

    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var navBar: NavigationBar!

    @IBOutlet weak var scaleSlider: CustomSlider!
    @IBOutlet weak var scaleNumberLabel: UILabel!
    
    var data: FollowUp?
    var currentScale = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        navBar.labelIndicator.isHidden = false
        if let isDetectionValid = data?.isDetectionResultValid, isDetectionValid {
            navBar.labelIndicator.text = "1/4"
        } else {
            navBar.labelIndicator.text = "2/5"
        }
        
        let thumbImage = UIImage(named: "indicator-\(currentScale)")
        scaleSlider.setThumbImage(thumbImage, for: .normal)
        scaleSlider.setThumbImage(thumbImage, for: .highlighted)
        questionLabel.text = data?.emotion.scaleQuestion
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        let scale = Int((sender.value * 10).rounded())
        if currentScale != scale {
            let thumbImage = UIImage(named: "indicator-\(scale)")
            sender.setThumbImage(thumbImage, for: .normal)
            sender.setThumbImage(thumbImage, for: .highlighted)
            currentScale = scale
            data?.scale = sender.value
            indicatorLabel.text = data?.scaleType?.rawValue
        }
        let trackRect = sender.trackRect(forBounds: sender.frame)
        let thumbRect = sender.thumbRect(forBounds: sender.bounds, trackRect: trackRect, value: sender.value)
        indicatorLabel.center.x = thumbRect.midX
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
