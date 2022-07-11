//
//  SplashViewController.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import UIKit.UILabel

final class SplashViewController: UIViewController {
    
    @IBOutlet private weak var splashLabel: UILabel!
    
    private var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !Reachability.isConnectedToNetwork() {
            self.showTryAgainAlert(title: "Hata", message: "Lütfen internet bağlantınızı kontrol ediniz.", isCancelable: false) { (_) in
                self.viewDidLoad()
            }
        }else {
            updateSplashLbl()
        }
    }
}

//MARK: - Private Funcs
private  extension SplashViewController {
    func updateSplashLbl() {
        let splashLblText = "TMDBMovieApp"
        var charIndex = 0.0

        for letter in splashLblText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.splashLabel.text?.append(letter)
            }
            charIndex += 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(splashLblText.count) * 0.2) + 1) {
            let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
            let navController = UINavigationController(rootViewController: vc)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
        }
    }
}
