//
//  BottomSheetViewController.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 18/10/20.
//

import UIKit
import Charts

class BottomSheetViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var bottomSheetScrollView: UIScrollView!
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    @IBOutlet weak var activitiesChartView: LineChartView!
    @IBOutlet weak var labelUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setupUI()
        setupChart()
        // Do any additional setup after loading the view.
    }
    func registerNib() {
        let nib = UINib(nibName: ActivitiesCollectionViewCell.nibName, bundle: nil)
        activitiesCollectionView?.register(nib, forCellWithReuseIdentifier: ActivitiesCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.activitiesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 109, height: 155)
        }
    }
    func setupUI(){
        self.sheetViewController?.handleScrollView(self.bottomSheetScrollView)
        labelUserName.text = UserDefaultsHelper.getData(type: String.self, forKey: .userName)
    }
    func setupChart(){
        activitiesChartView.delegate = self
        activitiesChartView.chartDescription?.enabled = true
        activitiesChartView.dragEnabled = true
        activitiesChartView.setScaleEnabled(true)
        activitiesChartView.pinchZoomEnabled = true
        
        activitiesChartView.rightAxis.enabled = false
        activitiesChartView.xAxis.enabled = true
        activitiesChartView.xAxis.drawGridLinesEnabled = false
        activitiesChartView.leftAxis.drawGridLinesEnabled = false
        
        activitiesChartView.legend.form = .line
        
        activitiesChartView.animate(xAxisDuration: 2.5)
        
        var lineChartEntry = [ChartDataEntry]()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let number = [1,5,3,7,5,3,9,7,15,25,9,11]
        for i in 0..<number.count {
            let value = ChartDataEntry(x: Double(i), y: Double(number[i]))
            lineChartEntry.append(value)
        }
        let lineChart = LineChartDataSet(entries: lineChartEntry, label: "Sad")
        lineChart.drawIconsEnabled = true
        lineChart.setColor(.black)
        lineChart.setCircleColor(.red)
        lineChart.lineWidth = 3
        lineChart.circleRadius = 3
        lineChart.drawCircleHoleEnabled = true
        lineChart.valueFont = .systemFont(ofSize: 9)
        lineChart.formLineWidth = 3
        lineChart.formSize = 15
        
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        lineChart.fillAlpha = 5
        lineChart.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        lineChart.drawFilledEnabled = true
        
        let lineChartData = LineChartData()
        lineChartData.addDataSet(lineChart)
        activitiesChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        activitiesChartView.xAxis.granularity = 1
        activitiesChartView.data = lineChartData
        activitiesChartView.chartDescription?.text = "Your Mood"
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

extension BottomSheetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivitiesCollectionViewCell.reuseIdentifier,
                                                         for: indexPath) as? ActivitiesCollectionViewCell {
            cell.configureCell(label: activityList[indexPath.row].label, image: activityList[indexPath.row].image)
            return cell
        }
        return UICollectionViewCell()
    }
}
//extension BottomSheetViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let cell: ActivitiesCollectionViewCell = Bundle.main.loadNibNamed(ActivitiesCollectionViewCell.nibName,
//                                                                      owner: self,
//                                                                      options: nil)?.first as? ActivitiesCollectionViewCell else {
//            return CGSize.zero
//        }
//        cell.configureCell(label: activityList[indexPath.row].label, image: activityList[indexPath.row].image)
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        return CGSize(width: size.width, height: size.height)
//    }
//}
