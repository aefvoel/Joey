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

let jacobsonExercises = [
    JacobsonExcercise(name: "Feet", instruction: "Lorem ipsum dolor sit amet", image: #imageLiteral(resourceName: "feetGuide")),
    JacobsonExcercise(name: "Abdomen", instruction: "Lorem ipsum dolor sit amet", image: #imageLiteral(resourceName: "feetGuide")),
    JacobsonExcercise(name: "Shoulders & Neck", instruction: "Lorem ipsum dolor sit amet", image: #imageLiteral(resourceName: "feetGuide"))
]

protocol JacobsonExerciseDelegate {
    func nextExercise()
    func getExercise() -> JacobsonExcercise
}
