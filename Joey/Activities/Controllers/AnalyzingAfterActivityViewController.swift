//
//  ActivitiesViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 22/10/20.
//

import UIKit

class AnalyzingAfterActivityViewController: UIViewController {
    
    var data: FollowUp?
    var activityInstruction: ActivitiesInstruction?
    
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var labelAwesome: UILabel!
    @IBOutlet weak var labelExplain: UIImageView!
    @IBOutlet weak var buttonYes: RoundedButton!
    @IBOutlet weak var buttonNo: RoundedButton!
    @IBOutlet weak var buttonFinish: RoundedButton!
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
    }
    
    func setupUI(){
        navBar.delegate = self
        self.view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func popTo<T>(_ vc: T.Type) {
       let targetVC = navigationController?.viewControllers.first{$0 is T}
       if let targetVC = targetVC {
          navigationController?.popToViewController(targetVC, animated: true)
       }
    }

    @IBAction func onStartButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toInstruction", sender: nil)
    }
    
    @IBAction func onNoButtonTapped(_ sender: Any) {
        popTo(HomeViewController.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InstructionViewController {
            vc.activityInstruction = activityInstruction
        }
    }
    // MARK: - Navigation

}
