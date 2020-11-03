//
//  WhyItWorksViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 26/10/20.
//

import UIKit

class hintsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.showsVerticalScrollIndicator = false
        textView.isEditable = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
