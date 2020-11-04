//
//  SettingsNameViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

class SettingsNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.delegate = self
        nameTextField.delegate = self
        nameTextField.text = UserDefaultsHelper.getData(type: String.self, forKey: .userName) ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onSaveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        if name == "" {
            let alert = AlertHelper.createAlert(title: "Oops!", message: "Please enter a nickname first.") {}
            present(alert, animated: true, completion: nil)
        } else {
            UserDefaultsHelper.setData(value: name, key: .userName)
            navigationController?.popViewController(animated: true)
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
