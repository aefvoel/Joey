//
//  SettingsViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var nameItem: SettingsItem!
    @IBOutlet weak var resetItem: SettingsItem!
    @IBOutlet weak var notificationsItem: SettingsItem!
    @IBOutlet weak var aboutItem: SettingsItem!
    @IBOutlet weak var faqItem: SettingsItem!
    @IBOutlet weak var privacyItem: SettingsItem!
    @IBOutlet weak var termsItem: SettingsItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        
        nameItem.addGestureRecognizer(getTapGestureRecognizer())
        resetItem.addGestureRecognizer(getTapGestureRecognizer())
        aboutItem.addGestureRecognizer(getTapGestureRecognizer())
        faqItem.addGestureRecognizer(getTapGestureRecognizer())
        privacyItem.addGestureRecognizer(getTapGestureRecognizer())
        termsItem.addGestureRecognizer(getTapGestureRecognizer())
    }
    
    func getTapGestureRecognizer() -> UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(self.onItemTapped(_:)))
    }
    
    @objc func onItemTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            switch sender.view {
            case nameItem:
                performSegue(withIdentifier: "toName", sender: nil)
            case resetItem:
                print("Reset!")
            case aboutItem:
                performSegue(withIdentifier: "toAbout", sender: nil)
            case faqItem:
                performSegue(withIdentifier: "toFAQ", sender: nil)
            case privacyItem:
                performSegue(withIdentifier: "toPrivacy", sender: nil)
            default:
                performSegue(withIdentifier: "toTerms", sender: nil)
            }
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
