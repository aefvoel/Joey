//
//  JacobsonViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class JacobsonViewController: UIViewController {
    
    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }

}
