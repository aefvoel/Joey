//
//  TermsOfServiceModel.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import Foundation

struct TermsOfServiceModel {
    var tosId: Int
    var tosQuestion: String
    var tosAnswer: String
    
    init(tosId: Int, tosQuestion: String, tosAnswer: String) {
        self.tosId = tosId
        self.tosQuestion = tosQuestion
        self.tosAnswer = tosAnswer
    }
    
}
