//
//  JacobsonViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class JacobsonViewController: UIViewController, JacobsonExerciseDelegate {
    
    var exercise: JacobsonExcercise?
    @IBOutlet weak var instructionImage: UIImageView!
    @IBOutlet weak var instructionText: TextViewFixed!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var navBar: NavigationBar!
    
    var currentExerciseIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateExerciseData()
        navBar.delegate = self
    }
    
    @IBAction func onStartButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toExercise", sender: nil)
    }
    
    func nextExercise() {
        if currentExerciseIndex < (jacobsonExercises.count - 1) {
            currentExerciseIndex += 1
            updateExerciseData()
        }
    }
    
    func isLastExercise() -> Bool {
        return currentExerciseIndex == jacobsonExercises.count - 1
    }
    
    func getExercise() -> JacobsonExcercise {
        return jacobsonExercises[currentExerciseIndex]
    }
    
    func updateExerciseData() {
        let exercise = getExercise()
        instructionImage.image = exercise.image
        instructionText.text = exercise.instruction
        exerciseLabel.text = exercise.name
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? JacobsonExerciseViewController {
            vc.delegate = self
        }
    }

}
