//
//  ViewController.swift
//  Sayaclar
//
//  Created by Özlem CİHAN on 30.07.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var kalanZaman = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kalanZaman = 5
        timeLabel.text = "Zaman: \(kalanZaman)"
    }

    @IBAction func baslatTiklandi(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(guncelle), userInfo: nil, repeats: true)
    }
    
    @objc func guncelle() {
        timeLabel.text = "Zaman: \(kalanZaman)"
        kalanZaman -= 1
        
        if kalanZaman == 0 {
            timeLabel.text = "Zamanı Geçmiştir!"
            timer.invalidate()
            kalanZaman = 5
    
        }
    }
}

