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

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //FB login button set
        let fbLoginBtn = FBSDKLoginButton()
        fbLoginBtn.readPermissions = ["public_profile", "email"]
        fbLoginBtn.center = self.view.center
        fbLoginBtn.delegate = self
        self.view.addSubview(fbLoginBtn)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        //login done checking
        if let _ = FBSDKAccessToken.current() {
            //modal
            print("login success")
//            performSegue(withIdentifier: "modalTop", sender: self)
        } else {
            //FB login button set
//            let fbLoginBtn = FBSDKLoginButton()
//            fbLoginBtn.readPermissions = ["public_profile", "email"]
//            fbLoginBtn.center = self.view.center
//            fbLoginBtn.delegate = self
//            self.view.addSubview(fbLoginBtn)
        }
    }
    //login callback　!ってなんだ？
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //error checking
        if error == nil {
            if result.isCancelled {
                print("キャンセル")
            } else {
                print("キャンセル")
            }
        }
    }
    //logout callback
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout done")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
