//
//  MirrorViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit
import ARKit
import Speech

class MirrorViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet var selectTime: [RoundedView]!
    @IBOutlet var labelTime: [UILabel]!
    
    var timer = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        navBar.delegate = self
        for time in labelTime {
            if time.tag == timer {
                time.font = UIFont.boldSystemFont(ofSize: time.font.pointSize)
            }
            else {
                time.font = UIFont.systemFont(ofSize: time.font.pointSize)
            }
            let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
            time.addGestureRecognizer(gesture)
        }

    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        timer = sender.view!.tag
        setupUI()
    }
    
    func showAlertAndBack(_ title: String, _ message: String) {
        let alert = AlertHelper.createAlert(title: "Your device doesn't support face tracking", message: "We can't proceed unless you have an iPhone X or newer") {
            self.navigationController?.popViewController(animated: true)
        }
        present(alert, animated: true)
    }
    
    
    @IBAction func onClickStart(_ sender: Any) {
        guard ARFaceTrackingConfiguration.isSupported else {
            showAlertAndBack("Your device doesn't support face tracking", "We can't proceed unless you have an iPhone X or newer")
            return
        }
        
        SFSpeechRecognizer.requestAuthorization { (status) in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.requestCameraAccess()

                case .denied:
                    self.showAlertAndBack("Failed to continue!", "Please allow us to access your microphone in your phone settings.")
                    
                case .restricted:
                    self.showAlertAndBack("Failed to continue!", "Please allow us to access your microphone in your phone settings.")
                    
                case .notDetermined:
                    self.showAlertAndBack("Failed to continue!", "Please allow us to access your microphone in your phone settings.")
                    
                @unknown default:
                    fatalError("Not expected!")
                }
            }
        }
    }
    
    func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { (granted) in
            if granted {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toStartPractice", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StartMirrorViewController {
            vc.totalTime = timer
        }
    }

}
