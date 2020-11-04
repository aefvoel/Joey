//
//  JacobsonExercise.swift
//  Joey
//
//  Created by Rahman Fadhil on 29/10/20.
//

import Foundation
import UIKit

struct JacobsonExcercise {
    let name: String
    let instruction: String
    let image: UIImage
}

let feetInstruction = """
    1.     Bring your attention to your feet.
    2.     Point your feet downward, and curl your toes under.
    3.     Tighten your toe muscles gently, but don’t strain.
    4.     Notice the tension for a few moments, then release, and notice the relaxation. Repeat.
    5.     Become aware of the difference between the muscles when they’re tensed and when they’re relaxed.
    6.     Continue to tense and relax the leg muscles from the foot to the abdominal area.
"""

let abdomenInstruction = """
    1.     Gently tighten the muscles of your abdomen, but don’t strain.
    2.     Notice the tension for a few moments. Then release, and notice the relaxation. Repeat.
    3.     Become aware of the difference between the tensed muscles and the relaxed muscles.
"""

let shouldersAndNeckInstruction = """
    1.     Very gently shrug your shoulders straight up towards your ears. Don’t strain.
    2.     Feel the tension for a few moments, release, and then feel the relaxation. Repeat.
    3.     Notice the difference between the tensed muscles and the relaxed muscles.
    4.     Focus on the neck muscles, first tensing and then relaxing until you feel total relaxation in this area.
"""

let jacobsonExercises = [
    JacobsonExcercise(name: "Feet", instruction: feetInstruction, image: #imageLiteral(resourceName: "feetGuide")),
    JacobsonExcercise(name: "Abdomen", instruction: abdomenInstruction, image: #imageLiteral(resourceName: "feetGuide")),
    JacobsonExcercise(name: "Shoulders & Neck", instruction: abdomenInstruction, image: #imageLiteral(resourceName: "feetGuide"))
]

protocol JacobsonExerciseDelegate {
    func nextExercise()
    func getExercise() -> JacobsonExcercise
    func isLastExercise() -> Bool
}
