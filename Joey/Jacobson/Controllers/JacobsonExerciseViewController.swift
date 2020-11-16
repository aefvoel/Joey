//
//  JacobsonExerciseViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 29/10/20.
//

import UIKit

class JacobsonExerciseViewController: UIViewController {
    
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionImageView: UIImageView!
    
    var exercise: JacobsonExcercise {
        JacobsonExcercise.list[currentExerciseIndex]
    }
    var currentExerciseIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        navBar.buttonDone.isHidden = false
        navBar.buttonDone.setTitle("Next", for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onNextClicked(_:)))
        navBar.buttonDone.addGestureRecognizer(tapGesture)
        
        updateExerciseData()
    }
    
    func updateExerciseData() {
        if currentExerciseIndex < JacobsonExcercise.list.count {
            titleLabel.text = exercise.title
            instructionLabel.text = exercise.instruction
            instructionImageView.image = exercise.image
        } else {
            titleLabel.text = "Well done!"
            instructionLabel.text = "We’re finished.. don’t you feel a little different?"
            instructionImageView.image = UIImage(named: "jacobson-finish")
            navBar.buttonDone.setTitle("Done", for: .normal)
        }
    }
    
    @objc func onNextClicked(_ sender: UITapGestureRecognizer) {
        if currentExerciseIndex < JacobsonExcercise.list.count {
            currentExerciseIndex += 1
            updateExerciseData()
        } else {
            performSegue(withIdentifier: "toFinish", sender: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AfterActivityViewController {
            vc.activityInstruction = activitiesInstructionArray[2]
        }
    }

}
