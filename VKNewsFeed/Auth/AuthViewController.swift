//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 11.11.21.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
    }

    @IBAction func logIn(_ sender: UIButton) {
        
        authService.wakeUpSession()
    }
    
}

