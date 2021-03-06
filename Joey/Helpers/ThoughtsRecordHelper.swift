//
//  ThoughtsRecordHelper.swift
//  Joey
//
//  Created by Setiawan Joddy on 27/10/20.
//

import Foundation
import UIKit
import CoreData

class ThoughtsRecordHelper {
    static let entityName = "ThoughtsRecord"
    
    static var context: NSManagedObjectContext = { () -> NSManagedObjectContext in
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    static func save(tRecord: ThoughtsRecordTemp, onComplete: @escaping (Error?) -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let record = NSManagedObject(entity: entity, insertInto: context)
        record.setValue(tRecord.situation, forKey: "situation")
        record.setValue(tRecord.moods.joined(separator: ","), forKey: "moods")
        record.setValue(tRecord.initialThoughts, forKey: "thoughts")
        record.setValue(tRecord.evidence, forKey: "evidence_support")
        record.setValue(tRecord.notSupportedEvidence, forKey: "evidence_not_support")
        record.setValue(tRecord.alternativeThoughts, forKey: "alternate_thoughts")
        record.setValue(tRecord.newMoods.joined(separator: ","), forKey: "new_moods")
        record.setValue(tRecord.createdAt, forKey: "createdAt")
        
        do {
            try context.save()
            onComplete(nil)
        } catch {
            onComplete(error)
        }
    }
    
    static func list(onComplete: @escaping ([ThoughtsRecord], Error?) -> Void) {
        let request = NSFetchRequest<ThoughtsRecord>(entityName: entityName)
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        do {
            let result = try context.fetch(request)
            onComplete(result, nil)
        } catch {
            onComplete([], error)
        }
    }
    
    static func deleteAll(onComplete: @escaping (Error?) -> Void) {
        list { (thoughts, error) in
            if let error = error {
                onComplete(error)
                return
            }
            
            for thought in thoughts{
                context.delete(thought)
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
