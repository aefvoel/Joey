//
//  OnboardingViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 14/10/20.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var buttonOnboarding: UIButton!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var viewLabelBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        buttonOnboarding?.layer.cornerRadius = 14.0
        labelName?.layer.cornerRadius = 14.0
        viewLabelBackground?.layer.cornerRadius = 14.0
        
    }

    @IBAction func onClickButtonEnterName(_ sender: Any) {
        if labelName.text == "" {
            //AlertHelper.createAlert(title: "Okay", message: "test", onComplete: <#T##() -> Void#>)
        }
        else {
            UserDefaultsHelper.setData(value: labelName.text, key: .userName)
        }
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
