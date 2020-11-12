//
//  StartMirrorViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 28/10/20.
//

import UIKit
import ARKit
import Speech
import CoreHaptics



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
    var hapticEngine: CHHapticEngine?
    
    let hints = MirrorHint.hints
    
    var countdownTimer: Timer!
    var totalTime: Int?
    var prepareTime = 3
    var currentHint: MirrorHint?
    
    var emotion: FollowUp.EmotionType?
    
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
                    print("words: \(words)")
                    print("hints: \(hint)")
                    if words.lowercased().hasSuffix(hint.lowercased()) {
                        self.playHaptic()
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
    
    func playHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHaptic()
        startRecording()
    }
    
    func setupHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            hapticEngine = try CHHapticEngine()
            try hapticEngine?.start()
            
            hapticEngine?.stoppedHandler = { reason in
                print("Stop Handler: The engine stopped for reason: \(reason.rawValue)")
                switch reason {
                case .audioSessionInterrupt: print("Audio session interrupt")
                case .applicationSuspended: print("Application suspended")
                case .idleTimeout: print("Idle timeout")
                case .systemError: print("System error")
                case .notifyWhenFinished:
                    print("Notify when finished")
                case .engineDestroyed:
                    print("Engine destroyed")
                case .gameControllerDisconnect:
                    print("Game controller disconnect")
                @unknown default:
                    print("Unknown error")
                }
            }
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
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
        if let vc = segue.destination as? AfterActivityViewController, let emotion = emotion {
            vc.activityInstruction = activitiesInstructionArray[0]
            vc.data = FollowUp(emotion: emotion)
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
        
        if data.browDownRight > 0.3 && data.browDownLeft > 0.3 {
            emotion = .angry
        } else if data.mouthFrownRight > 0.3 && data.mouthFrownLeft > 0.3 {
            emotion = .sad
        } else if data.mouthSmileRight > 0.3 && data.mouthSmileLeft > 0.3 {
            emotion = .happy
        } else {
            emotion = .neutral
        }
        
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

