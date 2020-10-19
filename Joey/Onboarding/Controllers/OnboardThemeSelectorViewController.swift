//
//  OnboardThemeSelectorViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 19/10/20.
//

import UIKit

class OnboardThemeSelectorViewController: UIViewController {
    
    var selectedColor = UserDefaultsHelper.getData(type: String.self, forKey: .themeColor)

    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var buttonThemeGreen: UIButton!
    @IBOutlet weak var buttonThemePurple: UIButton!
    @IBOutlet weak var buttonThemeBlue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContinue.layer.cornerRadius = 14.0
        defaultColorTheme()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onGreenButtonPressed(_ sender: Any) {
        UserDefaultsHelper.setData(value: "Green", key: .themeColor)
        buttonThemeGreen.setImage(#imageLiteral(resourceName: "GreenSelected"), for: .normal)
        buttonThemePurple.setImage(#imageLiteral(resourceName: "PurpleNotSelected"), for: .normal)
        buttonThemeBlue.setImage(#imageLiteral(resourceName: "BlueNotSelected"), for: .normal)
    }
    
    @IBAction func onPurpleButtonPressed(_ sender: Any) {
        UserDefaultsHelper.setData(value: "Purple", key: .themeColor)
        buttonThemeGreen.setImage(#imageLiteral(resourceName: "GreenNotSelected"), for: .normal)
        buttonThemePurple.setImage(#imageLiteral(resourceName: "PurpleSelected"), for: .normal)
        buttonThemeBlue.setImage(#imageLiteral(resourceName: "BlueNotSelected"), for: .normal)
    }
    
    @IBAction func onBlueButtonPressed(_ sender: Any) {
        UserDefaultsHelper.setData(value: "Blue", key: .themeColor)
        buttonThemeGreen.setImage(#imageLiteral(resourceName: "GreenNotSelected"), for: .normal)
        buttonThemePurple.setImage(#imageLiteral(resourceName: "PurpleNotSelected"), for: .normal)
        buttonThemeBlue.setImage(#imageLiteral(resourceName: "BlueSelected"), for: .normal)
        
    }
    
    func defaultColorTheme() {
        switch selectedColor {
        case "Green":
            buttonThemeGreen.setImage(#imageLiteral(resourceName: "GreenSelected"), for: .normal)
            buttonThemePurple.setImage(#imageLiteral(resourceName: "PurpleNotSelected"), for: .normal)
            buttonThemeBlue.setImage(#imageLiteral(resourceName: "BlueNotSelected"), for: .normal)
        default:
            print("Error")
        }
    }

}
