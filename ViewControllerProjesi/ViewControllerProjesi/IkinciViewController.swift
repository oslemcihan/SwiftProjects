//
//  IkinciViewController.swift
//  ViewControllerProjesi
//
//  Created by Özlem CİHAN on 28.07.2025.
//

import UIKit

class IkinciViewController: UIViewController {
    @IBOutlet var ikinciLabel: UIView!
    
    @IBOutlet weak var bulunanSifreLabel: UILabel!
    
    var verilenSifre = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        bulunanSifreLabel.text = verilenSifre
        
    }
    

   

}
