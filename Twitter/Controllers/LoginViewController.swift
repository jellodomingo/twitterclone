//
//  LoginViewController.swift
//  Twitter
//
//  Created by Angelo Domingo on 2/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.userLoggedIn.rawValue) == true {
            self.performSegue(withIdentifier: SeguesIdentifier.loginToHome.rawValue, sender: self)
        }
        
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = Urls.loginUrl.rawValue
        
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.userLoggedIn.rawValue)
        TwitterAPICaller.client?.login(url: myUrl, success: {
            self.performSegue(withIdentifier: SeguesIdentifier.loginToHome.rawValue, sender: self)
        }, failure: { (Error) in
                print("Could not log in!")
        })
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
