//
//  EmotionHelper.swift
//  Joey
//
//  Created by Rahman Fadhil on 20/10/20.
//

import UIKit
import CoreData

class EmotionHelper {
    static let entityName = "Emotion"
    
    static var context: NSManagedObjectContext = { () -> NSManagedObjectContext in
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    static func save(emotion: String, onComplete: @escaping (Error?) -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let emotion = NSManagedObject(entity: entity, insertInto: context)
        emotion.setValue(emotion, forKey: "category")
        emotion.setValue(Date(), forKey: "testedAt")
        
        do {
            try context.save()
            onComplete(nil)
        } catch {
            onComplete(error)
        }
    }
}
