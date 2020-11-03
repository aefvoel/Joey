//
//  NavigationBar.swift
//  Joey
//
//  Created by Toriq Wahid Syaefullah on 26/10/20.
//

import UIKit

class NavigationBar: UIView {
    
    private static let NIB_NAME = "NavigationBar"
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonDone: RoundedButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelIndicator: UILabel!
    var delegate: UIViewController!
    
    var title: String = "" {
        didSet {
            labelTitle.text = title
        }
    }
    var indicator: String = "" {
        didSet {
            labelIndicator.text = title
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        delegate.navigationController?.popViewController(animated: true)
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
