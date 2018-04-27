//
//  ProfileViewController.swift
//  Tinder
//
//  Created by TiAuna Dodd on 4/26/18.
//  Copyright © 2018 tiaunadodd. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    var newImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = newImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backtoHome(_ sender: UITapGestureRecognizer) {
    
    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "cardsView")
    self.present(homeVC!, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
