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
<li>Bring your attention to your feet.</li>
<li>Point your feet downward, and curl your toes under.</li>
<li>Tighten your toe muscles gently, but don’t strain.</li>
<li>Notice the tension for a few moments, then release, and notice the relaxation. Repeat.</li>
<li>Become aware of the difference between the muscles when they’re tensed and when they’re relaxed.</li>
<li>Continue to tense and relax the leg muscles from the foot to the abdominal area.</li>
"""

let abdomenInstruction = """
<li>Gently tighten the muscles of your abdomen, but don’t strain.</li>
<li>Notice the tension for a few moments. Then release, and notice the relaxation. Repeat.</li>
<li>Become aware of the difference between the tensed muscles and the relaxed muscles.</li>
"""

let shouldersAndNeckInstruction = """
<li>Very gently shrug your shoulders straight up towards your ears. Don’t strain.</li>
<li>Feel the tension for a few moments, release, and then feel the relaxation. Repeat.</li>
<li>Notice the difference between the tensed muscles and the relaxed muscles.</li>
<li>Focus on the neck muscles, first tensing and then relaxing until you feel total relaxation in this area.</li>
"""

let jacobsonExercises = [
    JacobsonExcercise(name: "Feet", instruction: feetInstruction, image: #imageLiteral(resourceName: "feetGuide")),
    JacobsonExcercise(name: "Abdomen", instruction: abdomenInstruction, image: #imageLiteral(resourceName: "abdomenGuide")),
    JacobsonExcercise(name: "Shoulders & Neck", instruction: abdomenInstruction, image: #imageLiteral(resourceName: "shouldersGuide"))
]

protocol JacobsonExerciseDelegate {
    func nextExercise()
    func getExercise() -> JacobsonExcercise
    func isLastExercise() -> Bool
}
