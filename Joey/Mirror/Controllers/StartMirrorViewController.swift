//
//  StartMirrorViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 28/10/20.
//

import UIKit
import ARKit
import Speech

struct MirrorHint {
    let hint: String
    let plainText: String
}

class StartMirrorViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var labelInstruction: UILabel!
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var labelPrepare: UILabel!
    @IBOutlet weak var imgMascot: UIImageView!
    @IBOutlet weak var imgNext: UIImageView!
    @IBOutlet weak var imgPrev: UIImageView!
    @IBOutlet weak var labelTextHint: UILabel!
    @IBOutlet weak var viewHint: RoundedView!
    @IBOutlet weak var imgBubble: UIImageView!
    var isSmile: Bool = false
    
    let hints = [
        MirrorHint(hint: "I’m getting stronger every day", plainText: "I'm getting stronger every day"),
        MirrorHint(hint: "I know my worth", plainText: "I know my worth"),
        MirrorHint(hint: "I have the courage to say “NO”", plainText: "I have the courage to say no")
    ]
    
    var countdownTimer: Timer!
    var totalTime: Int?
    var prepareTime = 3
    var currentHint: MirrorHint?
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    func startRecording() {
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record)
            try audioSession.setMode(.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            var isFinal = false
            if result != nil {
                if let hint = self.currentHint?.plainText, let words = result?.bestTranscription.formattedString {
                    if words.hasSuffix(hint) {
                        self.randomHint()
                    }
                }
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        print("Say something, I'm listening!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startRecording()
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
        labelPrepare.font = labelPrepare.font.withSize(48)
        viewHint.isHidden = true
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
            labelInstruction.text = "Start in \(prepareTime).."
            prepareTime -= 1
        } else {
            endTimer()
            startTimer()
            updateUI()
        }
    }
    
    private func updateUI(){
        labelInstruction.isHidden = true
        navBar.buttonDone.isHidden = false
        navBar.buttonDone.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.onClickButtonDone)))
        labelPrepare.text = ""
        imgMascot.isHidden = true
        imgBubble.isHidden = true
        viewHint.isHidden = false
        labelPrepare.isHidden = true
        currentHint = hints[Int.random(in: 0..<hints.count)]
        labelTextHint.text = currentHint?.hint
        imgPrev.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.randomHint)))
        imgNext.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.randomHint)))

    }
    
    @objc func onClickButtonDone(sender : UITapGestureRecognizer){
        endTimer()
        performSegue(withIdentifier: "toAfterActivity", sender: nil)
    }

    @objc func randomHint() {
        let index = Int.random(in: 0..<hints.count)
        labelTextHint.text = hints[index].hint
        currentHint = hints[index]
    }
    
    @objc func updateTime() {
        navBar.labelTitle.text = "\(timeFormatted(totalTime!))"
        if totalTime != 0 {
            totalTime! -= 1
        } else {
            endTimer()
            performSegue(withIdentifier: "toAfterActivity", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AfterActivityViewController {
            vc.activityInstruction = activitiesInstructionArray[0]
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
//        let workItem = DispatchWorkItem {
//            self.handleSmile(smileValue: CGFloat((data.mouthSmileLeft + data.mouthSmileRight)/2.0))
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: workItem)
        
    }
}

