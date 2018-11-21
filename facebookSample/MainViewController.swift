//
//  MainViewController.swift
//  facebookSample
//
//  Created by shogo.kitamura on 11/19/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class MainViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var currentUserName: UILabel!
    @IBOutlet weak var currentUserEmail: UILabel!
    @IBAction func logout(_ sender: Any) {
        let loginManager : FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    var userProfile : NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
        returnUserData()
    }
    func returnUserData(){
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil)
            {
                // エラー処理
                print("Error: \(error)")
            }
            else
            {
                //プロフィール写真を格納する
                self.userProfile = (result as! NSDictionary)
                print(self.userProfile)
                let picUrl = self.userProfile.value(forKeyPath: "picture.data.url")
//                let url = URL(string: user.imageURL)
                do {
                    let url = URL(string: picUrl as! String )
                    let data = try Data(contentsOf: url! as! URL)
                    let image = UIImage(data: data)
                    self.userImage.clipsToBounds = true
                    self.userImage.layer.cornerRadius = 60
                    self.userImage.image = image
                    
                }catch let err {
                    print("Error : \(err.localizedDescription)")
                }
                
//                var catPictureData = NSData(contentsOf: url as! URL) // nil
//                var catPicture = UIImage(data: catPictureData as! Data)                //プロフィール写真を取得して丸くする
                // TODO : swift4におけるpicture.data.urlの連想配列
//                let profileImageURL : String = self.userProfile.object(forKey: "picture") as! String
//                var profileImage = UIImage(data: NSData(contentsOf: NSURL(string: profileImageURL)! as URL)! as Data)
//                self.userImage.clipsToBounds = true
//                self.userImage.layer.cornerRadius = 60
//                self.userImage.image = profileImage
                //名前とEmailを取得する
                self.currentUserName.text = self.userProfile.object(forKey: "name") as? String
                self.currentUserEmail.text = self.userProfile.object(forKey: "email") as? String

            }
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
