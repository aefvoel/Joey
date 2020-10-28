//
//  FollowUp.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import Foundation

struct FollowUp {
    var emotion: EmotionType
    var isDetectionResultValid: Bool = true
    var correctEmotion: EmotionType?
    var reason: String?
    var scale: Float?
    
    enum EmotionType: Int {
        case angry = 1
        case sad = 2
        case neutral = 3
        case happy = 4
    }
    
    enum ScaleType {
        case big
        case medium
        case small
    }

    var scaleType: ScaleType? {
        if let scale = scale {
            if scale <= 0.3 {
                return .small
            } else if scale > 0.3 && scale <= 0.7 {
                return .medium
            } else {
                return .big
            }
        } else {
            return nil
        }
    }
    
    func suggestActivity() -> ActivitiesInstruction {
        let type = scaleType ?? .medium
        let currentEmotion = isDetectionResultValid ? emotion : correctEmotion ?? emotion
        let mirror = activitiesInstructionArray[0]
        let smile = activitiesInstructionArray[1]
        let jacobson = activitiesInstructionArray[2]
        
        if currentEmotion == .happy {
            switch type {
            case .small:
                return jacobson
            case .medium:
                return smile
            default:
                return mirror
            }
        } else if currentEmotion == .neutral {
            switch type {
            case .small:
                return jacobson
            case .medium:
                return smile
            default:
                return mirror
            }
        } else if currentEmotion == .angry {
            switch type {
            case .small:
                return smile
            case .medium:
                return mirror
            default:
                return jacobson
            }
        } else {
            switch type {
            case .small:
                return jacobson
            case .medium:
                return mirror
            default:
                return smile
            }
        }
    }
}
