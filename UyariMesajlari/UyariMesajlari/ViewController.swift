//
//  ViewController.swift
//  UyariMesajlari
//
//  Created by Özlem CİHAN on 29.07.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordTextTwo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func butonaTiklandi(_ sender: Any) {
        
        if emailText.text == "" {
            
            alertOlustur(titleGirdisi: "Uyarı", messageGirdisi: "Email Yanlış Verildi!")
            
            
        }else if passwordText.text == "" {
        
            
            alertOlustur(titleGirdisi: "Uyarı", messageGirdisi: "Parola Yanlış Verildi!")
            
        }else if passwordText.text != passwordTextTwo.text {
            
            
            alertOlustur(titleGirdisi: "Uyarı", messageGirdisi: "Parolalar Uyuşmuyor!")
        }else {
            
            alertOlustur(titleGirdisi: "Tebrikler!", messageGirdisi: "Kullanıcı oluşturuldu.")
            
        }
        
    }
    
    func alertOlustur(titleGirdisi : String, messageGirdisi : String) {
        
        let uyariMesaji = UIAlertController(title: titleGirdisi, message: messageGirdisi, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Ok butonu tiklandi.")
        }
        
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true, completion: nil)
        
    }
    
}
