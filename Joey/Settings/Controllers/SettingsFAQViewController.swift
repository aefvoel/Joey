//
//  SettingsFAQViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

class SettingsFAQViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SettingsAccordionTableViewController {
            vc.data = [
                AccordionItem(title: "How anonymous is this?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
                AccordionItem(title: "Who can see my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
                AccordionItem(title: "How can I protect my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
                AccordionItem(title: "Can I delete my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous.")
            ]
        }
    }

}
