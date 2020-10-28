//
//  ThoughtsRecord.swift
//  Joey
//
//  Created by Setiawan Joddy on 27/10/20.
//

import Foundation

struct ThoughtsRecordTemp {
    var situation: String?
    var moods: [String] = []
    var initialThoughts: String?
    var evidence: String?
    var notSupportedEvidence: String?
    var alternativeThoughts: String?
    var newMoods: [String] = []
    let createdAt = Date()
}
