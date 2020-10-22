//
//  TextViewFixed.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

@IBDesignable class TextViewFixed: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}
