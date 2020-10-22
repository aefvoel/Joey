//
//  ActivityListViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 22/10/20.
//

import UIKit

class ActivityListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var activityArray: [ActivityListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        activityArray = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    func createArray() -> [ActivityListModel] {
        
        var tempActivity: [ActivityListModel] = []
        
        let practiceSmiling = ActivityListModel(activityImage: #imageLiteral(resourceName: "PurpleNotSelected"), activityName: "Practice Smiling", activityShortDesc: "Practice Mindfulness")
        let mirrorTechnique = ActivityListModel(activityImage: #imageLiteral(resourceName: "GreenNotSelected"), activityName: "Mirror Technique", activityShortDesc: "Release Negative Thoughts")
        let jacobsonRelaxation = ActivityListModel(activityImage: #imageLiteral(resourceName: "BlueNotSelected"), activityName: "Jacobson's Relaxation", activityShortDesc: "Release Negative Thoughts")
        
        tempActivity.append(practiceSmiling)
        tempActivity.append(mirrorTechnique)
        tempActivity.append(jacobsonRelaxation)
        
        return tempActivity
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

extension ActivityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activities = activityArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityListCell") as! ActivityListCell
        
        cell.setActivity(activity: activities)
        
        return cell
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    //Buat ngesegue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
