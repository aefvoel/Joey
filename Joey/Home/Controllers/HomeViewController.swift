//
//  HomeViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 14/10/20.
//

import UIKit
import FittedSheets

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func onClickBottomSheet(_ sender: Any) {
//        let vc = BottomSheetViewController() //change this to your class name
//        self.present(vc, animated: true, completion: nil)
//        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
//        present(viewController, animated: true)
        openBottomSheet()
    }
    
    private func openBottomSheet(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        let options = SheetOptions(
            useInlineMode: true
        )
        let sheetController = SheetViewController(controller: controller, sizes: [.percent(0.6), .fullscreen], options: options)

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
