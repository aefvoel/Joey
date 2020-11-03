//
//  AlternativeThoughtsViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 27/10/20.
//

import UIKit

class AlternativeThoughtsViewController: UIViewController, UITextViewDelegate {
    
    var data: ThoughtsRecordTemp?
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "page_background3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    @IBOutlet weak var navBar: NavigationBar!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        textViewPlaceholder()
        dismissKeyboardOnScreen()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickContinueButton(_ sender: Any) {
        if textView.text == "Type your answer here" {
            textView.text = ""
        }
        guard let answer = textView?.text else { return }
        data?.alternativeThoughts = answer
        performSegue(withIdentifier: "toNewMoods", sender: nil)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func dismissKeyboardOnScreen() {
        let tapOnScreen: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        tapOnScreen.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapOnScreen)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textViewPlaceholder() {
        textView.delegate = self
        textView.text = "Type your answer here"
        textView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type your answer here"
            textView.textColor = UIColor.lightGray
        }
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 175
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NewMoodsViewController {
            vc.data = data
        }
    }
    

}
