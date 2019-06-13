//
//  ViewController.swift
//  koko
//
//  Created by Lisa Smolentseva on 22/03/2019.
//  Copyright © 2019 Lisa Smolentseva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    @IBOutlet weak var kok: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "счетчик"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func reset(_ sender: Any) {
        let alert = UIAlertController(title: "Ахтунг", message: "Точно обнуляем?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.count = 0
        }))
        alert.addAction(UIAlertAction(title: "Нiт", style: .default, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)

        kok.text = "\(count)"
    }
    @IBAction func lol(_ sender: Any) {
        count = count + 1
        kok.text = "\(count)"
    }
}

