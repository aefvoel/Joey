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
    @IBOutlet weak var buttonYes: RoundedButton!
    @IBOutlet weak var buttonNo: RoundedButton!
    @IBOutlet weak var buttonFinish: RoundedButton!
    @IBOutlet weak var buttonExplain: UIButton!
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
        navBar.labelIndicator.isHidden = false
        navBar.labelIndicator.text = "1/2"
        if let response = data?.emotion.analyze {
            suggestionLabel.text = "You just finished your activity!\n\(response)"
        }
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

    @IBAction func onStartButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            navBar.labelIndicator.text = "2/2"
            suggestionLabel.text = "I’m glad to hear that! You got better than before. Well done!"
            buttonFinish.isHidden = false
            buttonYes.isHidden = true
            buttonNo.isHidden = true
            labelAwesome.isHidden = true
            buttonExplain.isHidden = true
        } else if sender.tag == 2 {
            performSegue(withIdentifier: "toThoughtsRecord", sender: nil)
        } else if sender.tag == 3 {
            popTo(HomeViewController.self)
        }
    }
    
    @IBAction func onNoButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            navBar.labelIndicator.text = "2/2"
            suggestionLabel.text = "I’m sorry to hear that. I promise I will do better. I have another activity that you can do, Thoughts Record! Do you want to do it?"
            buttonNo.setTitle("Maybe Later", for: .normal)
            buttonNo.tag = 2
            buttonYes.tag = 2
            buttonExplain.tag = 2
            labelAwesome.isHidden = true
            buttonExplain.setTitle("Why it works?", for: .normal)
        } else if sender.tag == 2 {
            popTo(HomeViewController.self)
        }
    }
    
    @IBAction func onExplainButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            performSegue(withIdentifier: "toExplain", sender: nil)
        } else if sender.tag == 2 {
            performSegue(withIdentifier: "toHint", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InstructionViewController {
            vc.activityInstruction = activityInstruction
        }
    }
    // MARK: - Navigation

}
