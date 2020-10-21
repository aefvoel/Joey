//
//  HomeViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 14/10/20.
//

import UIKit
import FittedSheets

class HomeViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "homepage_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        openBottomSheet()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
    
    private func openBottomSheet(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        let options = SheetOptions(
            // Pulls the view controller behind the safe area top, especially useful when embedding navigation controllers
            useFullScreenMode: false,
            // Determines if using inline mode or not
            useInlineMode: true
        )
        let sheetController = SheetViewController(controller: controller, sizes: [.percent(0.5), .percent(0.7)], options: options)
        
        // The size of the grip in the pull bar
        sheetController.gripSize = CGSize(width: 83, height: 7)
        // The color of the grip on the pull bar
        sheetController.gripColor = UIColor(white: 0.868, alpha: 1)
        // The corner radius of the sheet
        sheetController.cornerRadius = 24
        // Disable the dismiss on background tap functionality
        sheetController.dismissOnOverlayTap = false
        // Disable the ability to pull down to dismiss the modal
        sheetController.dismissOnPull = false
        // Change the overlay color
        sheetController.overlayColor = UIColor.clear
        //        self.present(sheetController, animated: false, completion: nil)
        // Add child
        sheetController.willMove(toParent: self)
        self.addChild(sheetController)
        view.addSubview(sheetController.view)
        sheetController.didMove(toParent: self)
        
        sheetController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetController.view.topAnchor.constraint(equalTo: view.topAnchor),
            sheetController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // animate in
        sheetController.animateIn()
    }
}
