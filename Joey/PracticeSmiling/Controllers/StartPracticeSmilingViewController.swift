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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
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
    
    func handleSmile(smileValue: CGFloat) {
            switch smileValue {
            case _ where smileValue > 0.5:
                labelSmile.text = "😁"
            case _ where smileValue > 0.2:
                labelSmile.text = "🙂"
            default:
                labelSmile.text = "😐"
            }
        }
    
}

// MARK: - ARSCNView Delegate

extension StartPracticeSmilingViewController: ARSCNViewDelegate {
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
    
        DispatchQueue.main.async {
            // Update label for new smile value
            self.handleSmile(smileValue: CGFloat((data.mouthSmileLeft + data.mouthSmileRight)/2.0))
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}
