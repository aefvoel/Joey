//
//  SettingsTermsViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

struct TermsOfService {
    let title: String
    let content: String
}

class SettingsTermsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var terms = [
        TermsOfService(title: "How anonymous is this?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
        TermsOfService(title: "Who can see my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number."),
        TermsOfService(title: "How can I protect my data?", content: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous.")
    ]
    var selectedRow = 0

    @IBOutlet weak var termsTableView: UITableView!
    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        termsTableView.delegate = self
        termsTableView.dataSource = self
        termsTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "termsCell", for: indexPath) as! AccordionTableViewCell
        let term = terms[indexPath.row]
        cell.setup(title: term.title, content: term.content)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedRow == indexPath.row {
            return UITableView.automaticDimension
        } else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .none
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
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
