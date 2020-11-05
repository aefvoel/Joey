//
//  PrivPolicyTableViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 20/10/20.
//

import UIKit

class PrivPolicyTableViewController: UITableViewController {
    
    var selectedCellIndexPath: IndexPath?
    let unselectedCellHeight: CGFloat = 60.0
    
    var ppData = [PrivacyPolicyModel(ppQuestion: "General", ppAnswer: "Developers built the Joey app as a Free app. This App is provided by developer at no cost and is intended for use as is.\n\nThis page is used to inform visitors regarding the policies with the collection, use, and disclosure of Personal Information if anyone decided to use this app.\n\nIf you choose to use Joey, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the app. We will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Joey unless otherwise defined in this Privacy Policy."),
                  PrivacyPolicyModel(ppQuestion: "Information Collection and Use", ppAnswer: "For a better experience, while using Joey, we may require you to provide us with certain personally identifiable information, including but not limited to Name, Email, Camera, Pictures. The information that we request will be retained on your device and is not collected by us in any way.\n\nAs for the face detection, we will detect your face to better understand your emotion that we can see. We will analyze it using our technology but we will not record or save your face in any way.\n\nWhen we introduce facial recognition technology to your experience, we will let you know first and you will have control over our use of this technology for you."),
                  PrivacyPolicyModel(ppQuestion: "Log Data", ppAnswer: "We want to inform you that whenever you use Joey, in a case of an error in the app we collect data and information on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing Joey, the time and date of your use of Joey, and other statistics."),
                  PrivacyPolicyModel(ppQuestion: "Cookies", ppAnswer: "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\n\nJoey does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this application."),
                  PrivacyPolicyModel(ppQuestion: "Service Providers", ppAnswer: "We may employ third-party companies and individuals due to the following reasons:\n\n- To facilitate our Service;\n- To provide the Service on our behalf;\n- To perform Service-related services; or\n- To assist us in analyzing how our Service is used.\n\nWe want to inform users of Joey that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
                  PrivacyPolicyModel(ppQuestion: "Security", ppAnswer: "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
                  PrivacyPolicyModel(ppQuestion: "Links to Other Sites", ppAnswer: "This application may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
                  PrivacyPolicyModel(ppQuestion: "Children's Privacy", ppAnswer: "These application do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions."),
                  PrivacyPolicyModel(ppQuestion: "Changes to This Privacy Policy", ppAnswer: "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\n\nThis policy is effective as of 2020-10-30"),
                  PrivacyPolicyModel(ppQuestion: "Contact Us", ppAnswer: "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at joey@gmail.com.")
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
        return ppData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return UITableView.automaticDimension
        }
        return unselectedCellHeight
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "privPolicyCustomCell", for: indexPath) as? PrivPolicyTableViewCell else { return UITableViewCell() }
        
        let dataIndex = ppData[indexPath.row]
        cell.setupPPCell(ppData: dataIndex)
        
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
