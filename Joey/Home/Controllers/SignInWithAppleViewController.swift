//
//  SignInWithAppleViewController.swift
//  Joey
//
//  Created by Setiawan Joddy on 12/11/20.
//

import UIKit
import AuthenticationServices

class SignInWithAppleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignInWithApple()

        // Do any additional setup after loading the view.
    }
    
    func setupSignInWithApple() {
        let signInWithAppleButton = ASAuthorizationAppleIDButton()
        signInWithAppleButton.frame = CGRect(x: 64, y: 272, width: 286, height: 45)
        //signInWithAppleButton.center = subView.center
        signInWithAppleButton.addTarget(self, action: #selector(SignInWithAppleHandler), for: .touchUpInside)
        self.view.addSubview(signInWithAppleButton)
    }
    
    @objc func SignInWithAppleHandler() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let controller = ASAuthorizationController(authorizationRequests: [request])
            
            controller.delegate = self
            controller.presentationContextProvider = self
            
            controller.performRequests()
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

extension SignInWithAppleViewController: ASAuthorizationControllerDelegate {
    // ASAuthorizationControllerDelegate function for authorization failed
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }

    // ASAuthorizationControllerDelegate function for successful authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            
            print(userIdentifier)
            UserDefaultsHelper.setData(value: userIdentifier, key: .signInWithAppleIdentifier)
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toMySpace", sender: nil)
            }
            

            
            break
        default:
            break
        }
    }
    
}

extension SignInWithAppleViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
