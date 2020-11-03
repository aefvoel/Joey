//
//  SettingsTermsViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

struct AccordionItem {
    let title: String
    let content: String
}

class SettingsTermsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var terms = [
        AccordionItem(title: "How anonymous is this?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
        AccordionItem(title: "Who can see my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number."),
        AccordionItem(title: "How can I protect my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous.")
    ]
    var selectedIndexPath: IndexPath?

    @IBOutlet weak var termsTableView: UITableView!
    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        termsTableView.delegate = self
        termsTableView.dataSource = self
        termsTableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return terms.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "termsCell", for: indexPath) as! AccordionTableViewCell
        let term = terms[indexPath.section]
        cell.setup(title: term.title, content: term.content, isActive: selectedIndexPath == indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
            if let cell = tableView.cellForRow(at: indexPath) as? AccordionTableViewCell {
                cell.chevronImage.image = UIImage(systemName: "chevron.down")
            }
        } else {
            selectedIndexPath = indexPath
            if let cell = tableView.cellForRow(at: indexPath) as? AccordionTableViewCell {
                cell.chevronImage.image = UIImage(systemName: "chevron.up")
            }
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndexPath == indexPath {
            return UITableView.automaticDimension
        } else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .none
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
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
