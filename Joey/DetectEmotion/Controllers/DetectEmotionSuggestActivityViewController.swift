//
//  DetectEmotionSuggestActivityViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 27/10/20.
//

import UIKit

class DetectEmotionSuggestActivityViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
