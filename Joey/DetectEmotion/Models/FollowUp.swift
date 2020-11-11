//
//  FollowUp.swift
//  Joey
//
//  Created by Rahman Fadhil on 26/10/20.
//

import Foundation
import UIKit

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
        
        var description : String {
            switch self {
            case .angry: return "Need cheer-up"
            case .sad: return "Irritated"
            case .neutral: return "So-so"
            case .happy: return "Awesome"
            }
        }
        
        var response: String {
            switch self {
            case .angry: return "From what I see, you look like annoyed.\nIs that true?"
            case .sad: return "From what I see, you look need to be cheered up now.\nIs that true?"
            case .neutral: return "From what I see, you look quite fine.\nIs that true?"
            case .happy: return "Wow, what a good day for you! From what I see, you look happy!\nIs that true? "
            }
        }
        
        var image: UIImage {
            switch self {
            case .angry: return #imageLiteral(resourceName: "angry-icon")
            case .sad: return #imageLiteral(resourceName: "sad-icon")
            case .neutral: return #imageLiteral(resourceName: "neutral-icon")
            case .happy: return #imageLiteral(resourceName: "happy-icon")
            }
        }
        
        var scaleQuestion: String {
            switch self {
            case .angry: return "how intense do you think your annoyance is?"
            case .sad: return "how intense do you think you need to be cheered up?"
            case .neutral: return "how fine do you think you are at the moment?"
            case .happy: return "how intense do you think your happy day is?"
            }
        }
    }
    
    enum ScaleType: String {
        case big = "High"
        case medium = "Average"
        case small = "Very intense"
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
    
    func getAdvice() -> String {
        let thing = reason?.lowercased() ?? "it"
        switch emotion {
        case .angry: return "I see that \(thing) annoys you at the moment. You can’t calm the storm, but I am sure you can calm yourself under the storm..."
        case .sad: return "I see that \(thing) make you feel like need cheering up. You can’t calm the storm, but I am sure you can calm yourself under the storm..."
        case .neutral: return "I see that \(thing) make you feel like you’re fine. It’s really good that you can see it in a positive way, but actually you can do better!"
        case .happy: return "I see that \(thing) make you happy. Sometimes happiness comes from the smallest things in your life, and doing simple things can help you to be happier!"
        }
    }
}
