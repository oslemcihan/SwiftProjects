//
//  ViewController.swift
//  UserDefaultsProjesi
//
//  Created by Özlem CİHAN on 29.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var notTextField: UITextField!
    @IBOutlet weak var zamanTextFiled: UITextField!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var zamanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        if let gelenNot = kaydedilenNot as? String {
            notLabel.text = "Yapılacak İş : \(gelenNot)"
        }
        
        if let gelenZaman = kaydedilenZaman as? String {
            zamanLabel.text = "Yapılacak Zaman : \(gelenZaman)"
        }
    }

    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        UserDefaults.standard.set(notTextField.text!, forKey: "not")
        UserDefaults.standard.set(zamanTextFiled.text!, forKey: "zaman")
        
        notLabel.text = "Yapılacak İş : \(notTextField.text!)"
        zamanLabel.text = "Yapılacak Zaman : \(zamanTextFiled.text!)"
        
        
    }
    
    
    @IBAction func silTiklandi(_ sender: Any) {
        
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        
        
        if kaydedilenNot != nil {
            UserDefaults.standard.removeObject(forKey: "not")
            notLabel.text = "Yapilacak İş: "
        }
        
        if kaydedilenZaman != nil {
            UserDefaults.standard.removeObject(forKey: "zaman")
            zamanLabel.text = "Yapilacak Zaman: "
        }
        
        
    }
    
}

