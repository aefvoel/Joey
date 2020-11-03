//
//  HistoryViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 02/11/20.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelEmotion: UILabel!
    @IBOutlet weak var labelReason: UILabel!
    @IBOutlet weak var imageEmotion: UIImageView!
    @IBOutlet weak var imageReason: UIImageView!
    
    var emotionData: EmotionList!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "de_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        labelDate.text = emotionData.date
        labelEmotion.text = emotionData.emotion.description
        labelReason.text = emotionData.reason
        imageEmotion.image = emotionData.emotion.image
        imageReason.image = setImageReason(reason: emotionData.reason)
        navBar.delegate = self
        self.view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setImageReason(reason: String) -> UIImage {
        switch reason {
        case "Assignments":
            return #imageLiteral(resourceName: "assignment-icon")
        case "Work":
            return #imageLiteral(resourceName: "work-icon")
        case "Friends":
            return #imageLiteral(resourceName: "friends-icon")
        case "Thesis":
            return #imageLiteral(resourceName: "thesis-icon")
        case "Organization":
            return #imageLiteral(resourceName: "organization-icon")
        case "Relationship":
            return #imageLiteral(resourceName: "relationship-icon")
        case "Family":
            return #imageLiteral(resourceName: "family-icon")
        case "Money":
            return #imageLiteral(resourceName: "money-icon")
        case "Health":
            return #imageLiteral(resourceName: "health-icon")
        case "Other":
            return #imageLiteral(resourceName: "others-icon")
        default:
            return #imageLiteral(resourceName: "others-icon")
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
