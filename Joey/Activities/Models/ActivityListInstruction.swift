//
//  ActivityListInstruction.swift
//  Joey
//
//  Created by Setiawan Joddy on 14/10/20.
//
import Foundation
import UIKit

struct ActivitiesInstruction {
    var title: String
    var instructionContent: String
    var activityHelpsContent: String
    var whyItWorks: String
    var activityImage: UIImage
    var activityShortDesc: String
    var activityHomeImage: UIImage
}

var activitiesInstructionArray = [
    
    //Thought Records
    //ActivitiesInstruction(title: "Thought Records", instructionContent: "Ini Instruksi Bakal EE", activityHelpsContent: "Pokoknya Ini akan membantumu!", whyItWorks: "Aduh, Bagus Pokoknya", activityImage: #imageLiteral(resourceName: "GreenNotSelected"), activityShortDesc: "", activityHomeImage: #imageLiteral(resourceName: "detectEmotionIcon")),
    //Mirror Technique
    ActivitiesInstruction(title: "Mirror Technique", instructionContent: "This activity works by building your confidence use your subconscious mind. You look straight in front of the mirror, with your head up and shoulders back. Look into your eyes, breath deeply, and start repeating powerful affirmations out loud. Try to think of something positive about yourself and truly believe in every word when you see yourself in a mirror. You can say that you’re fabolous and compliment your clothes, hair, or anything that makes you feel great.\nP.S. During this activity, we will detect your face but it won’t be recorded or saved. Because we want to see your emotion progress.", activityHelpsContent: "List of Help", whyItWorks: "Terpercaya", activityImage: #imageLiteral(resourceName: "BlueNotSelected"), activityShortDesc: "Release negative thoughts", activityHomeImage: #imageLiteral(resourceName: "OB_joeyMascott")),
    //Smile
    ActivitiesInstruction(title: "Smile", instructionContent: "Pecahkan gelembung", activityHelpsContent: "List of Help", whyItWorks: "Bikin Candu", activityImage: #imageLiteral(resourceName: "GreenSelected"), activityShortDesc: "Practice Mindfulness", activityHomeImage: #imageLiteral(resourceName: "OB_joeyMascott")),
    //Jacobson's Technique
    ActivitiesInstruction(title: "Jacobson's Technique", instructionContent: "Tabok aja bor", activityHelpsContent: "List of Help", whyItWorks: "Semangatt", activityImage: #imageLiteral(resourceName: "PurpleNotSelected"), activityShortDesc: "Release negative thoughts", activityHomeImage: #imageLiteral(resourceName: "mascotImage")),
    
    //MARK: - Future Development
    //Practice Gratitude
    //ActivitiesInstruction(title: "Practice Gratitude", instructionContent: "Napas aja sih", activityHelpsContent: "List of Help", whyItWorks: "Skuyyy", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Practice Mindfulness", activityHomeImage: #imageLiteral(resourceName: <#T##String#>)),
    //Breath
    //ActivitiesInstruction(title: "Breath", instructionContent: "Ayodong Cerita", activityHelpsContent: "List of Help", whyItWorks: "Terpercaya", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Practice Mindfulness", activityHomeImage: #imageLiteral(resourceName: <#T##String#>)),
    //Express Emotion
    //ActivitiesInstruction(title: "Express your emotion", instructionContent: "Ayodong Cerita", activityHelpsContent: "List of Help", whyItWorks: "Terpercaya", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Release negative thoughts", activityHomeImage: #imageLiteral(resourceName: <#T##String#>))
]
