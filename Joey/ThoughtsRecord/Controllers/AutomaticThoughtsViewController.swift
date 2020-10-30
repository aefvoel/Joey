//
//  AutomaticThoughtsViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 26/10/20.
//

import UIKit

class AutomaticThoughtsViewController: UIViewController, UITextViewDelegate {
    
    var data: ThoughtsRecordTemp?
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    @IBOutlet weak var navBar: NavigationBar!
    
    @IBOutlet weak var textViewInitialThoughts: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        textViewPlaceholder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickContinueButton(_ sender: Any) {
        guard let answer = textViewInitialThoughts?.text else { return }
        data?.initialThoughts = answer
        performSegue(withIdentifier: "toEvidence", sender: nil)
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
    
    func textViewPlaceholder() {
        textViewInitialThoughts.delegate = self
        textViewInitialThoughts.text = "Type your answer here"
        textViewInitialThoughts.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewInitialThoughts.textColor == UIColor.lightGray {
            textViewInitialThoughts.text = nil
            textViewInitialThoughts.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textViewInitialThoughts.text.isEmpty {
            textViewInitialThoughts.text = "Type your answer here"
            textViewInitialThoughts.textColor = UIColor.lightGray
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EvidenceViewController {
            vc.data = data
        }
    }
    

}
