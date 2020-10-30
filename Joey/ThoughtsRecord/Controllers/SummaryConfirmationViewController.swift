//
//  SummaryConfirmationViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 29/10/20.
//

import UIKit

class SummaryConfirmationViewController: UIViewController {
    
    var data: ThoughtsRecordTemp?
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickYesButton(_ sender: Any) {
        performSegue(withIdentifier: "toTRSummary", sender: nil)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SummaryViewController {
            vc.data = data
        }
    }

}
