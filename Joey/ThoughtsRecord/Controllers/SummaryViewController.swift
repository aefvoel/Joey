//
//  SummaryViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 28/10/20.
//

import UIKit

class SummaryViewController: UIViewController {
    
    struct ThoughtData {
        var title: String
        var content: String
    }
    
    var segueFromHistory = false
    
    var data: ThoughtsRecordTemp?

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var navBar: NavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneButton: RoundedButton!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var thoughts = [ThoughtData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArrayfromThoughtsData()
        print(thoughts)
        setupUI()
        setupTableView()
        formattedDate()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if segueFromHistory {
            doneButton.isEnabled = false
            doneButton.alpha = 0.0
        }
    }
    
    @IBAction func onClickButtonDone(_ sender: Any) {
        performSegue(withIdentifier: "toDoActivityConfirmation", sender: nil)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    func formattedDate() {
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMMM d, yyyy"
        dateLabel.text = format.string(from: data!.createdAt)
    }
    
    func createArrayfromThoughtsData() {
        if let data = data {
            thoughts.append(ThoughtData(title: "Situation", content: data.situation!))
            thoughts.append(ThoughtData(title: "Moods", content: data.moods.joined(separator: ", ")))
            thoughts.append(ThoughtData(title: "Initial Thoughts", content: data.initialThoughts!))
            thoughts.append(ThoughtData(title: "Evidence that Supports", content: data.evidence!))
            thoughts.append(ThoughtData(title: "Evidence that does not Support", content: data.notSupportedEvidence!))
            thoughts.append(ThoughtData(title: "Alternative Thoughts", content: data.alternativeThoughts!))
            thoughts.append(ThoughtData(title: "New Moods", content: data.newMoods.joined(separator: ", ")))
        }
    }
    
    func setupUI(){
        navBar.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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

extension SummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return thoughts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thought = thoughts[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell") as! SummaryTableViewCell
        
        cell.title.text = thought.title
        cell.content.text = thought.content
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 14
        cell.layer.borderColor = #colorLiteral(red: 0.4125145674, green: 0.7986539006, blue: 0.7881773114, alpha: 1)
        print(thought)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }


}
