//
//  DetectEmotionAnalyzeViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 19/10/20.
//

import UIKit
import ARKit

class DetectEmotionAnalyzeViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    var emotion: FollowUp.EmotionType?
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        navBar.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sceneViewTapped))
        tapGesture.delegate = self
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sceneView.session.pause()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetectEmotionValidateViewController, let emotion = emotion {
            vc.data = FollowUp(emotion: emotion)
        }
    }

}

// MARK: - ARSCNView Delegate

extension DetectEmotionAnalyzeViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device else { return nil }
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
            return
        }
        
        let data = FaceData(faceAnchor)
        
        if data.browDownRight > 0.3 && data.browDownLeft > 0.3 {
            emotion = .angry
        } else if data.mouthFrownRight > 0.3 && data.mouthFrownLeft > 0.3 {
            emotion = .sad
        } else if data.mouthSmileRight > 0.3 && data.mouthSmileLeft > 0.3 {
            emotion = .happy
        } else {
            emotion = .neutral
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}

// MARK: - Gesture Recognizer

extension DetectEmotionAnalyzeViewController: UIGestureRecognizerDelegate {
    @objc func sceneViewTapped() {
        performSegue(withIdentifier: "toQuestions", sender: nil)
    }
}
