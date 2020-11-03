//
//  MySpaceViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 29/10/20.
//

import UIKit
import Charts

class MySpaceViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var labelMonth: UILabel!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var cardView: CardView!
    var listEmotion = [EmotionList]()
    var listEmotionByMonth = [EmotionList]()
    var emotionData: EmotionList!
    var listMonth = [String]()
    let emotionType = ["",
                       FollowUp.EmotionType.angry.description,
                       FollowUp.EmotionType.sad.description,
                       FollowUp.EmotionType.neutral.description,
                       FollowUp.EmotionType.happy.description]

    @IBOutlet weak var historyCollectionView: UICollectionView!
    var selectedActivity: ActivitiesInstruction?
    var selectedMonth: String?
    var recordData = [ThoughtsRecordTemp]()
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "de_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @IBOutlet weak var labelSadCount: UILabel!
    @IBOutlet weak var labelHappyCount: UILabel!
    @IBOutlet weak var labelAngryCount: UILabel!
    @IBOutlet weak var labelNeutralCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerNib()
        getEmotionHistory()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        navBar.delegate = self
        self.view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    @IBAction func onNextButton(_ sender: Any) {
        guard !listMonth.isEmpty else {
            return
        }
        let currentIndex = listMonth.firstIndex(of: selectedMonth ?? String()) ?? -1
        var nextIndex = currentIndex + 1
        nextIndex = listMonth.indices.contains(nextIndex) ? nextIndex : 0
        selectedMonth = listMonth[nextIndex]
        setupChart(month: selectedMonth!)
        
    }
    
    @IBAction func onPrevButton(_ sender: Any) {
        guard !listMonth.isEmpty else {
            return
        }
        let currentIndex = listMonth.firstIndex(of: selectedMonth ?? String()) ?? -1
        var nextIndex = currentIndex - 1
        nextIndex = listMonth.indices.contains(nextIndex) ? nextIndex : listMonth.count - 1
        selectedMonth = listMonth[nextIndex]
        setupChart(month: selectedMonth!)
        
    }
    
    func registerNib() {
        let nib = UINib(nibName: HistoryCollectionViewCell.nibName, bundle: nil)
        historyCollectionView?.register(nib, forCellWithReuseIdentifier: HistoryCollectionViewCell.reuseIdentifier)
    }
    
    func getEmotionHistory(){
        EmotionHelper.list { (list: [Emotion], _: Error?) in
            list.forEach { emotion in
                let date = emotion.value(forKey: "testedAt") as! Date
                let emotionType = emotion.value(forKey: "emotion") as! Int
                let formatDay = date.getFormattedDate(format: "d")
                let formatMonth = date.getFormattedDate(format: "MMMM")

                self.listEmotion.append(EmotionList(
                                            emotion: FollowUp.EmotionType(rawValue: emotionType)!,
                                            reason: emotion.value(forKey: "reason") as! String,
                                            scale: emotion.value(forKey: "scale") as! Float,
                                            date: date,
                                            day: Int(formatDay)!,
                                            month: formatMonth))
                
                self.listMonth.append(formatMonth)
            }
        }
        
        ThoughtsRecordHelper.list { (list: [ThoughtsRecord], _: Error?) in
            list.forEach { data in
                let moods = data.value(forKey: "moods") as? String
                let moodsArray = moods?.components(separatedBy: ",")
                let newMoods = data.value(forKey: "new_moods") as? String
                let newMoodsArray = newMoods?.components(separatedBy: ",")
                self.recordData.append(ThoughtsRecordTemp(
                                        situation: data.value(forKey: "situation") as? String,
                                        moods: moodsArray!,
                                        initialThoughts: data.value(forKey: "thoughts") as? String,
                                        evidence: data.value(forKey: "evidence_support") as? String,
                                        notSupportedEvidence: data.value(forKey: "evidence_not_support") as? String,
                                        alternativeThoughts: data.value(forKey: "alternate_thoughts") as? String,
                                        newMoods: newMoodsArray!,
                                        createdAt: data.value(forKey: "createdAt") as! Date))
            }
        }
        
        
        
        DispatchQueue.main.async {
            self.viewHeight.constant = self.historyCollectionView.contentSize.height
            self.listMonth = self.listMonth.unique()
            self.selectedMonth = self.listMonth.last ?? ""
            self.setupChart(month: self.selectedMonth!)
        }
        
    }
    func setupChart(month: String){
        labelMonth.text = month
        barChartView.delegate = self
        barChartView.chartDescription?.enabled = false
        barChartView.dragEnabled = true
        barChartView.setScaleEnabled(false)
        barChartView.pinchZoomEnabled = false
        
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.enabled = true
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.legend.enabled = false
        
        barChartView.animate(xAxisDuration: 2.5)
        
        var barChartEntry = [BarChartDataEntry]()
        
        var angryCount = 0
        var happyCount = 0
        var sadCount = 0
        var neutralCount = 0
        listEmotionByMonth.removeAll()
        for i in 0..<listEmotion.count {
            if listEmotion[i].month == month {
                listEmotionByMonth.append(listEmotion[i])
                let value = BarChartDataEntry(x: Double(listEmotion[i].day), y: Double(listEmotion[i].emotion.rawValue))
                barChartEntry.append(value)
                
            }
            if (listEmotion.count - 7) <= i  {
                switch listEmotion[i].emotion.rawValue {
                case 1: angryCount += 1
                case 2: sadCount += 1
                case 3: neutralCount += 1
                case 4: happyCount += 1
                default :
                    break
                }
            }
        }

        listEmotionByMonth.reverse()
        historyCollectionView.reloadData()
        labelSadCount.text = "\(sadCount) times"
        labelAngryCount.text = "\(angryCount) times"
        labelNeutralCount.text = "\(neutralCount) times"
        labelHappyCount.text = "\(happyCount) times"
        
        let barChart = BarChartDataSet(entries: barChartEntry)
        barChart.setColor(UIColor(red: 0.35, green: 0.76, blue: 0.74, alpha: 1.00))
        barChart.drawValuesEnabled = false
        
        let lineChartData = BarChartData()
        lineChartData.addDataSet(barChart)
        barChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: emotionType)
        barChartView.xAxis.granularity = 5
        barChartView.xAxis.axisMinimum = 1
        barChartView.xAxis.axisMaximum = 31
        barChartView.leftAxis.granularity = 1
        barChartView.leftAxis.axisMinimum = 0
        barChartView.leftAxis.axisMaximum = 4

        barChartView.data = lineChartData
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
extension MySpaceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listEmotionByMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.reuseIdentifier,
                                                         for: indexPath) as? HistoryCollectionViewCell {
            let formatDate = listEmotionByMonth[indexPath.row].date.getFormattedDate(format: "EEEE, MMMM d yyyy, h:mm a")
            cell.configureCell(label: formatDate)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        emotionData = listEmotionByMonth[indexPath.row]
        performSegue(withIdentifier: "toHistory", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HistoryViewController {
            vc.emotionData = emotionData
            vc.recordData = recordData
        }
    }
    
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

