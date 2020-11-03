//
//  MirrorViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit
import ARKit

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
    
    
    @IBAction func onClickStart(_ sender: Any) {
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
