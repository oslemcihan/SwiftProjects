//
//  ViewController.swift
//  IlkUygulamam
//
//  Created by Özlem CİHAN on 23.07.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var benimLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        benimLabel.text = "Benim ilk uygulamam"
    }
    
    
}

