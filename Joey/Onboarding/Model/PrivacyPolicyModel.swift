//
//  PrivacyPolicyModel.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import Foundation

struct PrivacyPolicyModel {
    var privPolicyQuestion: String
    var privPolicyAnswer: String
    
    init(ppQuestion: String, ppAnswer: String) {
        self.privPolicyQuestion = ppQuestion
        self.privPolicyAnswer = ppAnswer
    }
    
}
