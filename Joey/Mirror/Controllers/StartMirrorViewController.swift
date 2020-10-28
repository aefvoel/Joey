//
//  StartMirrorViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 28/10/20.
//

import UIKit
import ARKit

class StartMirrorViewController: UIViewController {

    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var labelPrepare: UILabel!
    
    var isSmile: Bool! {
        didSet {
            print(isSmile!)
        }
    }
    
    var countdownTimer: Timer!
    var totalTime: Int?
    var prepareTime = 3
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "de_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        startPrepareTimer()
        navBar.delegate = self
        sceneView.delegate = self
        self.view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        sceneView.session.run(configuration)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sceneView.session.pause()
        countdownTimer.invalidate()
    }
    
    func handleSmile(smileValue: CGFloat) {
        if smileValue > 0.2 {
            isSmile = true
        }
        else {
            isSmile = false
        }
    }
    
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    func startPrepareTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updatePrepareTime), userInfo: nil, repeats: true)
    }
    
    @objc func updatePrepareTime() {
        labelPrepare.text = "\(prepareTimeFormatted(prepareTime))"
        
        if prepareTime != 0 {
            prepareTime -= 1
        } else {
            endTimer()
            startTimer()
        }
    }
    
    @objc func updateTime() {
        labelTimer.text = "\(timeFormatted(totalTime!))"
        labelPrepare.text = "Confused on what to say?"
        if totalTime! < 55 && totalTime! > 10 {
            DispatchQueue.main.async {
                if self.isSmile {
                    self.labelInstruction.text = "Yup! Keep that smile longer.. Hold on for 5 more seconds!"
                } else {
                    self.labelInstruction.text = "Think of something positive about yourself and try to smile naturally"
                }
            }
        }
        else if totalTime! < 10 && totalTime! > 0 {
            labelInstruction.text = "Almost there.."
        }
        
        
        if totalTime != 0 {
            totalTime! -= 1
        } else {
            endTimer()
            performSegue(withIdentifier: "toAfterActivity", sender: nil)
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func prepareTimeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%2d", seconds)
    }
    
}

// MARK: - ARSCNView Delegate

extension StartMirrorViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else {
            return
        }
        
        let data = FaceData(faceAnchor)
        
//        DispatchQueue.main.async {
//            self.handleSmile(smileValue: CGFloat((data.mouthSmileLeft + data.mouthSmileRight)/2.0))
//        }
//
        let workItem = DispatchWorkItem {
            self.handleSmile(smileValue: CGFloat((data.mouthSmileLeft + data.mouthSmileRight)/2.0))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: workItem)
        
    }
}

