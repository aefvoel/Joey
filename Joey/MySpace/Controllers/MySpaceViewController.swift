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
        setupChart()
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
    }
    
    @IBAction func onPrevButton(_ sender: Any) {
    }
    
    func setupChart(){
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
        let emotionType = ["","Need cheer-up", "Irritated", "So-so", "Awesome"]
        let number = [1,1,1,2,3,4,1,2,3,4,1,2,3,4,3,2,2,2,3,3,3,2,1,1,4,4,3,4,1,4]
        for i in 0..<number.count {
            let value = BarChartDataEntry(x: Double(i+1), y: Double(number[i]))
            barChartEntry.append(value)
        }
        let barChart = BarChartDataSet(entries: barChartEntry, label: "Sad")
        barChart.setColor(UIColor(red: 0.35, green: 0.76, blue: 0.74, alpha: 1.00))
        barChart.drawValuesEnabled = false
        
        let lineChartData = BarChartData()
        lineChartData.addDataSet(barChart)
//        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        barChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: emotionType)
        barChartView.xAxis.granularity = 1.0
        barChartView.leftAxis.granularity = 1

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
