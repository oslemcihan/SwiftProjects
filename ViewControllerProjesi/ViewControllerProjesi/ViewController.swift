//
//  ViewController.swift
//  ViewControllerProjesi
//
//  Created by Özlem CİHAN on 28.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birinciLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var alinanSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kontrolEtTiklandi(_ sender: Any) {
        
        alinanSifre = textField.text!
        
        if alinanSifre == "ozlem" {
            performSegue(withIdentifier: "toIkinciVC", sender: nil)
        } else {
            birinciLabel.text = "Hatalı Giriş"
        }
        
   
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toIkinciVC" {
            
            let destinationVC = segue.destination as! IkinciViewController
            
            destinationVC.verilenSifre = alinanSifre
        }
        
    }
    
}

