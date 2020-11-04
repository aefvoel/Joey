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
    @IBOutlet weak var recordCollectionView: UICollectionView!
    @IBOutlet weak var recordView: RoundedView!
    var recordData = [ThoughtsRecordTemp]()
    var recordDataByDay = [ThoughtsRecordTemp]()
    var selectedData: ThoughtsRecordTemp?
    
    var emotionData: EmotionList!
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerNib()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        let formatDate = emotionData.date.getFormattedDate(format: "EEEE, MMMM d yyyy, h:mm a")
        labelDate.text = formatDate
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
        
        for data in self.recordData {
            if data.createdAt.getFormattedDate(format: "EEEE, MMMM d yyyy") == self.emotionData.date.getFormattedDate(format: "EEEE, MMMM d yyyy") {
                self.recordDataByDay.append(data)
            }
        }
        
        if recordDataByDay.isEmpty {
            recordView.isHidden = true
        }
        
    }
    func registerNib() {
        let nib = UINib(nibName: RecordCollectionViewCell.nibName, bundle: nil)
        recordCollectionView?.register(nib, forCellWithReuseIdentifier: RecordCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.recordCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 62, height: 53)
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SummaryViewController {
            vc.data = selectedData
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

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recordDataByDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordCollectionViewCell.reuseIdentifier,
                                                         for: indexPath) as? RecordCollectionViewCell {
            cell.configureCell(label: "#\(indexPath.row + 1)")
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedData = recordDataByDay[indexPath.row]
        performSegue(withIdentifier: "toSummary", sender: nil)
    }
    
}
