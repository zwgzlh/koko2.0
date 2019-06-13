//
//  SecondViewController.swift
//  koko
//
//  Created by Lisa Smolentseva on 11/04/2019.
//  Copyright © 2019 Lisa Smolentseva. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var viewKoko: UIView!
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewKoko.backgroundColor = .red
        constraintHeight.constant += 10
        title = "анимация"
    }
 
    @IBAction func buttonAction(_ sender: Any) {
        UIView.animate(withDuration: 3) {
            self.constraintHeight.constant += 10
            self.view.layoutSubviews()
            
        }
        
    }
 
    @IBAction func buttonAction2(_ sender: Any) {
        UIView.animate(withDuration: 3) {
            self.constraintHeight.constant -= 10
            self.view.layoutSubviews()
        }
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
