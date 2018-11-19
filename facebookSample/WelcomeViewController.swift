//
//  ViewController.swift
//  facebookSample
//
//  Created by shogo.kitamura on 9/26/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class WelcomeViewController: UIViewController,FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fbLoginBtn = FBSDKLoginButton()
        fbLoginBtn.readPermissions = ["public_profile", "email"]
        fbLoginBtn.center = self.view.center
        fbLoginBtn.delegate = self
        self.view.addSubview(fbLoginBtn)
    }
    override func viewDidAppear(_ animated: Bool) {
        //login done checking
        if let _ = FBSDKAccessToken.current() {
            //ログイン済みだとView表示時
            print("User Already Logged In")
            self.performSegue(withIdentifier: "showMain", sender: nil)
        } else {
        }
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //error checking
        if error == nil {
            if result.isCancelled {
                print("キャンセルしたで")
            } else {
                print("ログインしたで")
                if result.grantedPermissions.contains("email")
                {
                    self.performSegue(withIdentifier: "showMain", sender: self)
                }
            }
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //ログアウト時処理
        print("logout done")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
