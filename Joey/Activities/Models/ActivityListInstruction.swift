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
    var whyItWorks: [String]
    var scientificReason: String
    var activityImage: UIImage
    var activityShortDesc: String
    var activityHomeImage: UIImage
    var activityInstructionImage: UIImage
}

var activitiesInstructionArray = [
    
    //Mirror Technique
    ActivitiesInstruction(
        title: "Mirror Technique",
//        instructionContent: "This activity works by building your confidence use your subconscious mind. You look straight in front of the mirror, with your head up and shoulders back. Look into your eyes, breath deeply, and start repeating powerful affirmations out loud. Try to think of something positive about yourself and truly believe in every word when you see yourself in a mirror. You can say that you’re fabolous and compliment your clothes, hair, or anything that makes you feel great.\nP.S. During this activity, we will detect your face but it won’t be recorded or saved. Because we want to see your emotion progress.",
        instructionContent: "This activity works by building your confidence use your subconscious mind: \n1. Think about your phone camera as your mirror.\n2. Look straight in front of your phone camera with your head up and shoulders back. \n3. Look into your eyes, breath deeply.\n4. Read the powerful affirmations out loud and clear. \n5. You will be checked whether you are really telling yourself powerful affirmations or not by detecting your voice.\n\nP.S. During this activity, we will detect your face but it won't be recorded or saved. Because we want to see your emotion progress. ",
        activityHelpsContent: "List of Help",
        whyItWorks: ["Boost your self-esteem instantly", "Get a higher opinion of yourself", "Start believing your own abilities "],
        scientificReason: "A mirror doesn't have to be just for checking on your appearance. It's a great tool for self-reflection and building self-confidence. According to the Mirror Technique, it can also effectively build success. \n\nOne classic self-help book, The Magic of Believing, by Claude Bristol, discusses this technique in detail. Bristol writes,\n\nMany great orators, preachers, actors, and statesmen have used the mirror technique. According to Drew Pearson, Winston Churchill never made a speech of importance unless he made it before a mirror first. Pearson also declared that Woodrow Wilson employed the same technique.\n\nBy using the mirror...you are creating a picture of yourself, your words, the sound of your voice, and your sight of the audience, to which the immediate future is to bring reality,\n\nAnd, the author explains, By looking into the mirror, you increase the mental vibrations by which the force and meaning of your words will quickly penetrate to your audience's subconscious minds.\n\nSource:\nhttps://www.inc.com/peter-economy/the-vbest-mirror-affirmations-for-confidence-success-beyond-what-you-ever-imagined.html",
        activityImage: #imageLiteral(resourceName: "mirrorTechnique_activityList"),
        activityShortDesc: "Boost Self-Esteem Instantly",
        activityHomeImage: #imageLiteral(resourceName: "Mirror Technique_miniCard"),
        activityInstructionImage: #imageLiteral(resourceName: "MT_InstructionNew")
    ),
    
    //Practice Smile
    ActivitiesInstruction(
        title: "Practice Smiling",
        instructionContent: "When you feel distress caused by an upsetting situation, smiling is one way to reduce it even just forcing a smile when you don't feel like it is enough to lift your mood slightly: \n1. Try to smile naturally with your eyes narrow \n2. Think of something positive about yourself and truly believe in every word.\n\nP.S. During this activity, we will detect your face but it won't be recorded or saved. Because we want to see your emotion progress. ",
        activityHelpsContent: "List of Help",
        whyItWorks: ["Increase your ability to think holistically", "Reduce the distress", "Improve mood"],
        scientificReason: "A new study led by a Michigan State University business scholar suggests customer-service workers who fake smile throughout the day worsen their mood and withdraw from work, affecting productivity. But workers who smile as a result of cultivating positive thoughts--such as a tropical vacation or a child's recital--improve their mood and withdraw less.\n\nAccording to PsyBlog, smiling can improve our attention and help us perform better on cognitive tasks: smiling makes us feel good which also increases our attentional flexibility and our ability to think holistically. When this idea was tested by Johnson et al. (2010), the results showed that participants who smiled performed better on attentional tasks which required seeing the whole forest rather than just the trees.\n\nA smile is also a good way to reduce some of the pain we feel in troubling circumstances: smiling is one way to reduce the distress caused by an upsetting situation. Psychologists call this the facial feedback hypothesis. Even forcing a smile when we don't feel like it is enough to lift our mood slightly (this is one example of embodied cognition).\n\nSource:\nhttps://medium.com/marketing-and-entrepreneurship/want-to-be-happier-science-says-do-these-11-things-every-single-day-e0cf47ff54bd",
        activityImage: #imageLiteral(resourceName: "practiceSmiling_activityList"),
        activityShortDesc: "Reduce Distress",
        activityHomeImage: #imageLiteral(resourceName: "practiceSmiling_miniCard"),
        activityInstructionImage: #imageLiteral(resourceName: "instruction_practicesmiling")
    ),
    
    //Jacobson's Technique
    ActivitiesInstruction(
        title: "Jacob's Relaxation",
        instructionContent: "Jacobson's relaxation technique is a type of therapy that focuses on tightening and relaxing specific muscle groups in sequence. It's also known as progressive relaxation therapy. By concentrating on specific areas and tensing and then relaxing them, you can become more aware of your body and physical sensations. ",
        activityHelpsContent: "List of Help",
        whyItWorks: ["Relieving anxiety", "Reducing work-related", "Lowering your blood pressure", "improving your sleep "],
        scientificReason: "Dr. Edmund Jacobson invented the technique in the 1920s as a way to help his patients deal with anxiety. Dr. Jacobson felt that relaxing the muscles could relax the mind as well. The technique involves tightening one muscle group while keeping the rest of the body relaxed, and then releasing the tension.\n\nResearch shows a connection between relaxation and blood pressure, perhaps because stress is a contributing factor to high blood pressure. Research both old and new provides some evidence that Jacobson's relaxation technique may help people with epilepsy reduce the amount and frequency of their seizures. Larger sample sizes are needed.\n\nJacobson's relaxation technique is commonly used to help people with insomnia as well. Over the years, several studies have looked at whether it's effective. Some have had mixed results, while others show more promise. In some cases, people who didn't get more sleep still felt better rested after relaxation therapy.\n\nSource:\nhttps://www.healthline.com/health/what-is-jacobson-relaxation-technique#wholebody-technique ",
        activityImage: #imageLiteral(resourceName: "jackobsRelaxation_activityList"),
        activityShortDesc: "Relieving Anxiety",
        activityHomeImage: #imageLiteral(resourceName: "Jackob_miniCard"),
        activityInstructionImage: #imageLiteral(resourceName: "instruction_jacobson")
    ),
    
    //Thought Records
    //ActivitiesInstruction(title: "Thought Records", instructionContent: "Ini Instruksi Bakal EE", activityHelpsContent: "Pokoknya Ini akan membantumu!", whyItWorks: "Aduh, Bagus Pokoknya", activityImage: #imageLiteral(resourceName: "GreenNotSelected"), activityShortDesc: "", activityHomeImage: #imageLiteral(resourceName: "detectEmotionIcon")),
    
    //MARK: - Future Development
    //Practice Gratitude
    //ActivitiesInstruction(title: "Practice Gratitude", instructionContent: "Napas aja sih", activityHelpsContent: "List of Help", whyItWorks: "Skuyyy", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Practice Mindfulness", activityHomeImage: #imageLiteral(resourceName: <#T##String#>)),
    //Breath
    //ActivitiesInstruction(title: "Breath", instructionContent: "Ayodong Cerita", activityHelpsContent: "List of Help", whyItWorks: "Terpercaya", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Practice Mindfulness", activityHomeImage: #imageLiteral(resourceName: <#T##String#>)),
    //Express Emotion
    //ActivitiesInstruction(title: "Express your emotion", instructionContent: "Ayodong Cerita", activityHelpsContent: "List of Help", whyItWorks: "Terpercaya", activityImage: #imageLiteral(resourceName: <#T##String#>), activityShortDesc: "Release negative thoughts", activityHomeImage: #imageLiteral(resourceName: <#T##String#>))
]
