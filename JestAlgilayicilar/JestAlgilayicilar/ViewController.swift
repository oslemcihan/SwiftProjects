//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by Özlem CİHAN on 30.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    var ankara = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselDegitir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func gorselDegitir() {
            if ankara {
                if let image = UIImage(named: "ankara_6_asama") {
                    imageView.image = image
                    label.text = "Ankara_6_asama"
                } else {
                    print("ankara_6_asama görseli bulunamadı!")
                }
                ankara = false
            } else {
                if let image = UIImage(named: "ankara") {
                    imageView.image = image
                    label.text = "Ankara"
                } else {
                    print("ankara görseli bulunamadı!")
                }
                ankara = true
            }
        }
        
    }

