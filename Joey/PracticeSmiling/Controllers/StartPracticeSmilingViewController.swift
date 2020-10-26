//
//  StartPracticeSmilingViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 22/10/20.
//

import UIKit
import ARKit
import AVFoundation

class StartPracticeSmilingViewController: UIViewController {
    
    @IBOutlet weak var labelSmile: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var progressBarTimer: Timer!
    var isRunning = false
    var isSmile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        sceneView.delegate = self
        progressView.progress = 0.0
        progressView.layer.cornerRadius = 4
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
    }
    
    func handleSmile(smileValue: CGFloat) {
        switch smileValue {
        case _ where smileValue > 0.2:
            isSmile = true

        default:
            isSmile = false
            setRunning()
        }
    }
    
    func setRunning(){
        if isRunning {
            progressBarTimer.invalidate()
        } else {
            progressView.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)
        }
        isRunning = !isRunning
        
    }
    @objc func updateProgressView(){
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        if(progressView.progress == 1.0)
        {
            progressBarTimer.invalidate()
            isRunning = false
        }
    }
}

// MARK: - ARSCNView Delegate

extension StartPracticeSmilingViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else {
            return
        }
        
        let data = FaceData(faceAnchor)
        
        DispatchQueue.main.async {
            // Update label for new smile value
            self.handleSmile(smileValue: CGFloat((data.mouthSmileLeft + data.mouthSmileRight)/2.0))
        }
        
    }
}
