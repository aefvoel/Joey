//
//  OnboardingViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 14/10/20.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var buttonOnboarding: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var viewLabelBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        buttonOnboarding?.layer.cornerRadius = 14.0
        viewLabelBackground?.layer.cornerRadius = 14.0
        dismissKeyboardOnScreen()
        textFieldName?.delegate = self
        if UserDefaultsHelper.getData(type: Bool.self, forKey: .isLoggedIn)! {
            if let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @IBAction func onClickButtonEnterName(_ sender: Any) {
        if textFieldName.text?.isEmpty == true {
            let alert = AlertHelper.createAlert(title: "Oops!", message: "Please enter your nickname first.") {
                
            }
            alert.view.tintColor = #colorLiteral(red: 0.3529411765, green: 0.7607843137, blue: 0.7411764706, alpha: 1)
            present(alert, animated: true, completion: nil)
            
        }
        else {
            UserDefaultsHelper.setData(value: textFieldName.text, key: .userName)
            UserDefaultsHelper.setData(value: "Green", key: .themeColor)
            UserDefaultsHelper.setData(value: true, key: .isLoggedIn)
        }
    }
    
    func dismissKeyboardOnScreen() {
        let tapOnScreen: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        tapOnScreen.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapOnScreen)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension OnboardingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textFieldName: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
}
