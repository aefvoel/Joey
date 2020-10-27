//
//  MoodsViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 27/10/20.
//

import UIKit

class MoodsViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        if sender.backgroundColor == .white {
            sender.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.7607843137, blue: 0.7411764706, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            sender.tintColor = .clear
            sender.isSelected = true
        }
        else {
            sender.backgroundColor = .white
            sender.setTitleColor(.black, for: .normal)
            sender.isSelected = false
        }
    }
    
    func setupUI(){
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
