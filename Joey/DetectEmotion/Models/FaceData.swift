//
//  FaceData.swift
//  Joey
//
//  Created by Rahman Fadhil on 20/10/20.
//

import Foundation
import ARKit

class FaceData {
    // Left Eye
    var eyeBlinkLeft: Double
    var eyeLookDownLeft: Double
    var eyeLookInLeft: Double
    var eyeLookOutLeft: Double
    var eyeLookUpLeft: Double
    var eyeSquintLeft: Double
    var eyeWideLeft: Double

    // Right Eye
    var eyeBlinkRight: Double
    var eyeLookDownRight: Double
    var eyeLookInRight: Double
    var eyeLookOutRight: Double
    var eyeLookUpRight: Double
    var eyeSquintRight: Double
    var eyeWideRight: Double

    // Mouth and Jaw
    var jawForward: Double
    var jawLeft: Double
    var jawRight: Double
    var jawOpen: Double
    var mouthClose: Double
    var mouthFunnel: Double
    var mouthPucker: Double
    var mouthLeft: Double
    var mouthRight: Double
    var mouthSmileLeft: Double
    var mouthSmileRight: Double
    var mouthFrownLeft: Double
    var mouthFrownRight: Double
    var mouthDimpleLeft: Double
    var mouthDimpleRight: Double
    var mouthStretchLeft: Double
    var mouthStretchRight: Double
    var mouthRollLower: Double
    var mouthRollUpper: Double
    var mouthShrugLower: Double
    var mouthShrugUpper: Double
    var mouthPressLeft: Double
    var mouthPressRight: Double
    var mouthLowerDownLeft: Double
    var mouthLowerDownRight: Double
    var mouthUpperUpLeft: Double
    var mouthUpperUpRight: Double

    // Eyebrows, Cheeks, and Nose
    var browDownLeft: Double
    var browDownRight: Double
    var browInnerUp: Double
    var browOuterUpLeft: Double
    var browOuterUpRight: Double
    var cheekPuff: Double
    var cheekSquintLeft: Double
    var cheekSquintRight: Double
    var noseSneerLeft: Double
    var noseSneerRight: Double
    
    // Tongue
    var tongueOut: Double
    
    init(_ faceAnchor: ARFaceAnchor) {
        eyeBlinkLeft = faceAnchor.blendShapes[.eyeBlinkLeft]?.doubleValue ?? 0
        eyeLookDownLeft = faceAnchor.blendShapes[.eyeLookDownLeft]?.doubleValue ?? 0
        eyeLookInLeft = faceAnchor.blendShapes[.eyeLookInLeft]?.doubleValue ?? 0
        eyeLookOutLeft = faceAnchor.blendShapes[.eyeLookOutLeft]?.doubleValue ?? 0
        eyeLookUpLeft = faceAnchor.blendShapes[.eyeLookUpLeft]?.doubleValue ?? 0
        eyeSquintLeft = faceAnchor.blendShapes[.eyeSquintLeft]?.doubleValue ?? 0
        eyeWideLeft = faceAnchor.blendShapes[.eyeWideLeft]?.doubleValue ?? 0
        eyeBlinkRight = faceAnchor.blendShapes[.eyeBlinkRight]?.doubleValue ?? 0
        eyeLookDownRight = faceAnchor.blendShapes[.eyeLookDownRight]?.doubleValue ?? 0
        eyeLookInRight = faceAnchor.blendShapes[.eyeLookInRight]?.doubleValue ?? 0
        eyeLookOutRight = faceAnchor.blendShapes[.eyeLookOutRight]?.doubleValue ?? 0
        eyeLookUpRight = faceAnchor.blendShapes[.eyeLookUpRight]?.doubleValue ?? 0
        eyeSquintRight = faceAnchor.blendShapes[.eyeSquintRight]?.doubleValue ?? 0
        eyeWideRight = faceAnchor.blendShapes[.eyeWideRight]?.doubleValue ?? 0
        jawForward = faceAnchor.blendShapes[.jawForward]?.doubleValue ?? 0
        jawLeft = faceAnchor.blendShapes[.jawLeft]?.doubleValue ?? 0
        jawRight = faceAnchor.blendShapes[.jawRight]?.doubleValue ?? 0
        jawOpen = faceAnchor.blendShapes[.jawOpen]?.doubleValue ?? 0
        mouthClose = faceAnchor.blendShapes[.mouthClose]?.doubleValue ?? 0
        mouthFunnel = faceAnchor.blendShapes[.mouthFunnel]?.doubleValue ?? 0
        mouthPucker = faceAnchor.blendShapes[.mouthPucker]?.doubleValue ?? 0
        mouthLeft = faceAnchor.blendShapes[.mouthLeft]?.doubleValue ?? 0
        mouthRight = faceAnchor.blendShapes[.mouthRight]?.doubleValue ?? 0
        mouthSmileLeft = faceAnchor.blendShapes[.mouthSmileLeft]?.doubleValue ?? 0
        mouthSmileRight = faceAnchor.blendShapes[.mouthSmileRight]?.doubleValue ?? 0
        mouthFrownLeft = faceAnchor.blendShapes[.mouthFrownLeft]?.doubleValue ?? 0
        mouthFrownRight = faceAnchor.blendShapes[.mouthFrownRight]?.doubleValue ?? 0
        mouthDimpleLeft = faceAnchor.blendShapes[.mouthDimpleLeft]?.doubleValue ?? 0
        mouthDimpleRight = faceAnchor.blendShapes[.mouthDimpleRight]?.doubleValue ?? 0
        mouthStretchLeft = faceAnchor.blendShapes[.mouthStretchLeft]?.doubleValue ?? 0
        mouthStretchRight = faceAnchor.blendShapes[.mouthStretchRight]?.doubleValue ?? 0
        mouthRollLower = faceAnchor.blendShapes[.mouthRollLower]?.doubleValue ?? 0
        mouthRollUpper = faceAnchor.blendShapes[.mouthRollUpper]?.doubleValue ?? 0
        mouthShrugLower = faceAnchor.blendShapes[.mouthShrugLower]?.doubleValue ?? 0
        mouthShrugUpper = faceAnchor.blendShapes[.mouthShrugUpper]?.doubleValue ?? 0
        mouthPressLeft = faceAnchor.blendShapes[.mouthPressLeft]?.doubleValue ?? 0
        mouthPressRight = faceAnchor.blendShapes[.mouthPressRight]?.doubleValue ?? 0
        mouthLowerDownLeft = faceAnchor.blendShapes[.mouthLowerDownLeft]?.doubleValue ?? 0
        mouthLowerDownRight = faceAnchor.blendShapes[.mouthLowerDownRight]?.doubleValue ?? 0
        mouthUpperUpLeft = faceAnchor.blendShapes[.mouthUpperUpLeft]?.doubleValue ?? 0
        mouthUpperUpRight = faceAnchor.blendShapes[.mouthUpperUpRight]?.doubleValue ?? 0
        browDownLeft = faceAnchor.blendShapes[.browDownLeft]?.doubleValue ?? 0
        browDownRight = faceAnchor.blendShapes[.browDownRight]?.doubleValue ?? 0
        browInnerUp = faceAnchor.blendShapes[.browInnerUp]?.doubleValue ?? 0
        browOuterUpLeft = faceAnchor.blendShapes[.browOuterUpLeft]?.doubleValue ?? 0
        browOuterUpRight = faceAnchor.blendShapes[.browOuterUpRight]?.doubleValue ?? 0
        cheekPuff = faceAnchor.blendShapes[.cheekPuff]?.doubleValue ?? 0
        cheekSquintLeft = faceAnchor.blendShapes[.cheekSquintLeft]?.doubleValue ?? 0
        cheekSquintRight = faceAnchor.blendShapes[.cheekSquintRight]?.doubleValue ?? 0
        noseSneerLeft = faceAnchor.blendShapes[.noseSneerLeft]?.doubleValue ?? 0
        noseSneerRight = faceAnchor.blendShapes[.noseSneerRight]?.doubleValue ?? 0
        tongueOut = faceAnchor.blendShapes[.tongueOut]?.doubleValue ?? 0
    }
}
