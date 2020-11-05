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
    
    static func save(data: FollowUp, onComplete: @escaping (Error?) -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let emotion = NSManagedObject(entity: entity, insertInto: context)
        emotion.setValue(data.emotion.rawValue, forKey: "emotion")
        emotion.setValue(data.isDetectionResultValid, forKey: "isResultValid")
        emotion.setValue(data.reason, forKey: "reason")
        emotion.setValue(data.scale, forKey: "scale")
        emotion.setValue(Date(), forKey: "testedAt")
        
        do {
            try context.save()
            onComplete(nil)
        } catch {
            onComplete(error)
        }
    }
    
    static func list(onComplete: @escaping ([Emotion], Error?) -> Void) {
        let request = NSFetchRequest<Emotion>(entityName: entityName)
        let sort = NSSortDescriptor(key: "testedAt", ascending: true)
        request.sortDescriptors = [sort]
        do {
            let result = try context.fetch(request)
            onComplete(result, nil)
        } catch {
            onComplete([], error)
        }
    }
    
    static func deleteAll(onComplete: @escaping (Error?) -> Void) {
        list { (emotions, error) in
            if let error = error {
                onComplete(error)
                return
            }
            
            for emotion in emotions {
                context.delete(emotion)
            }
            
            do {
                try context.save()
                onComplete(nil)
            } catch {
                onComplete(error)
            }
        }
    }
}
