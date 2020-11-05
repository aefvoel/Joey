//
//  TermsOfServiceModel.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import Foundation

struct TermsOfServiceModel {
    var tosQuestion: String
    var tosAnswer: String
    
    init(tosQuestion: String, tosAnswer: String) {
        self.tosQuestion = tosQuestion
        self.tosAnswer = tosAnswer
    }
    
}
