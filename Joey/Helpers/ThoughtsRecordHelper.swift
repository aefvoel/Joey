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
    
    static func save(tRecord: String, onComplete: @escaping (Error?) -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let tRecord = NSManagedObject(entity: entity, insertInto: context)
        tRecord.setValue(String(), forKey: "situation")
        tRecord.setValue([String](), forKey: "moods")
        tRecord.setValue(String(), forKey: "thoughts")
        tRecord.setValue(String(), forKey: "evidence_support")
        tRecord.setValue(String(), forKey: "evidence_not_support")
        tRecord.setValue(String(), forKey: "alternate_thoughts")
        tRecord.setValue([String](), forKey: "new_moods")
        
        do {
            try context.save()
            onComplete(nil)
        } catch {
            onComplete(error)
        }
    }
}
