//
//  DetectEmotionAnalyzeViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 19/10/20.
//

import UIKit
import ARKit

class DetectEmotionAnalyzeViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
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
        if let vc = segue.destination as? DetectEmotionResultViewController {
            vc.faceImage = sceneView.snapshot()
            vc.emotion = "SAD" // TODO: replace with real emotion result
        }
    }

}

// MARK: - ARSCNView Delegate

extension DetectEmotionAnalyzeViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device else { return nil }
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .fill
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
            return
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}

// MARK: - Gesture Recognizer

extension DetectEmotionAnalyzeViewController: UIGestureRecognizerDelegate {
    @objc func sceneViewTapped() {
        performSegue(withIdentifier: "toResult", sender: nil)
    }
}
