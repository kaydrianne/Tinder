//
//  CardsViewController.swift
//  Tinder
//
//  Created by TiAuna Dodd on 4/26/18.
//  Copyright © 2018 tiaunadodd. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
     var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.isUserInteractionEnabled = true
        cardImageView.image = #imageLiteral(resourceName: "ryan")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didPanGesture(_ sender: UIPanGestureRecognizer) {
    
    
    let translation = sender.translation(in: cardImageView)
    
    if sender.state == .began {
    print("Gesture began")
    cardInitialCenter = cardImageView.center
    
    } else if sender.state == .changed {
    print("Gesture is changing")
    // using translation direction to rotate & translate
    cardImageView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 8) * (translation.x * 0.01))
    cardImageView.center.x = cardInitialCenter.x + translation.x
    cardImageView.center.y = cardInitialCenter.y + translation.y
    
    } else if sender.state == .ended {
    print("Gesture ended")
    self.cardImageView.alpha = 0
    
    if (translation.x < 50) {
    print("Swiped Left")
    UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut,
    animations: { self.cardImageView.alpha = 1 },
    completion: { (Bool) in
    self.cardImageView.removeFromSuperview()
    })
    
    } else if (translation.x > 50) {
    print("Swiped Right")
    UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut,
    animations: { self.cardImageView.alpha = 1 },
    completion: { (Bool) in
    self.cardImageView.removeFromSuperview()
    })
    
    } else {
    cardImageView.transform = CGAffineTransform.identity
    }
  }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as! ProfileViewController
        destinationView.newImage = cardImageView.image
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
