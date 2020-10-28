//
//  InstructionViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class InstructionViewController: UIViewController {
    
    @IBOutlet var instructionView: InstructionView!
    var activityInstruction: ActivitiesInstruction?

    @IBOutlet weak var navBar: NavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        if let data = activityInstruction {
            instructionView.setupData(data: data)
        }
    }
    
    @IBAction func buttonContinueTapped(_ sender: Any) {
        switch activityInstruction?.title {
        case "Mirror Technique":
            performSegue(withIdentifier: "toMirror", sender: nil)
        case "Jacobson's Technique":
            performSegue(withIdentifier: "toJacobson", sender: nil)
        case "Smile":
            performSegue(withIdentifier: "toSmiling", sender: nil)
        default:
            navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
