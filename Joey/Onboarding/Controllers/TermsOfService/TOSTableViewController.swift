//
//  TOSTableViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import UIKit

class TOSTableViewController: UITableViewController {
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 230.0
    let unselectedCellHeight: CGFloat = 60.0
    
    var tosData = [
        TermsOfServiceModel(tosId: 0, tosQuestion: "How anonymous is this? ", tosAnswer: "You do not need to go through a registration or sign-up process, so you do not need to give us an email id or phone number. This makes sure that all your conversations are totally anonymous."),
        TermsOfServiceModel(tosId: 1, tosQuestion: "Who can see my data?", tosAnswer: "All your conversations are confidential, encrypted and securely stored. We do not share your personal information with any third parties."),
        TermsOfServiceModel(tosId: 2, tosQuestion: "How can I protect my data?", tosAnswer: "You can set a PIN on the appName to protect unauthorized access of your conversation messages"),
        TermsOfServiceModel(tosId: 3, tosQuestion: "Can I delete my data?", tosAnswer: "You can ‘reset your data’ in the setting side menu on right top of the appName. You cannot  reverse or recover your past data after reset.")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tosData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tosCustomCell", for: indexPath) as? TOSTableViewCell else { return UITableViewCell() }
        
        let dataIndex = tosData[indexPath.row]
        cell.setupCell(tosData: dataIndex)
        
        cell.selectionStyle = .none
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
        
        print("Cell \(indexPath.row) selected")
        
    }

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}
